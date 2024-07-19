import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_burning_bros/core/theme/app_color.dart';
import 'package:test_burning_bros/core/theme/app_textstyle.dart';
import 'package:test_burning_bros/presentation/cubits/product/product_cubit.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool searchBoolean;
  final VoidCallback onSearchTap;
  final VoidCallback onClearSearch;
  final VoidCallback onFavoriteTap;
  final ProductCubit cubit;
  CustomAppBar({
    super.key,
    required this.searchBoolean,
    required this.onSearchTap,
    required this.onClearSearch,
    required this.onFavoriteTap,
    required this.cubit,
  });
  final _searchController = TextEditingController();
  Timer? _debounce;
  final int _debounceDuration = 900;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      automaticallyImplyLeading: false,
      title: !searchBoolean
          ? Text(
              'Product List',
              style: AppTextStyles.textStyleBold(
                color: Colors.white,
                fontSize: 22,
              ),
            )
          : _searchTextField(),
      actions: !searchBoolean
          ? [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: onSearchTap,
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: onFavoriteTap,
              ),
            ]
          : [
              IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: onClearSearch,
              ),
            ],
    );
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        if (s.isNotEmpty) {
          _debounce?.cancel();
          _debounce = Timer(Duration(milliseconds: _debounceDuration), () {
            cubit.searchProducts(s);
          });
        } else {
          cubit.fetchProducts();
        }
      },
      autofocus: true,
      controller: _searchController,
      cursorColor: Colors.white,
      style: AppTextStyles.textStyle(color: Colors.white, fontSize: 16),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search...',
        hintStyle: AppTextStyles.textStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
