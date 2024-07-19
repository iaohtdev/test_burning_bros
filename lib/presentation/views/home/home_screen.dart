import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/core/router/app_routes.dart';
import 'package:test_burning_bros/core/theme/app_textstyle.dart';
import 'package:test_burning_bros/presentation/cubits/product/product_cubit.dart';
import 'package:test_burning_bros/presentation/cubits/product/product_state.dart';
import 'package:test_burning_bros/presentation/views/home/components/app_bar.dart';
import 'package:test_burning_bros/presentation/views/home/components/item_product.dart';
import 'package:test_burning_bros/presentation/widgets/app_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _searchBoolean = false;
  Timer? _debounce;
  late ProductCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<ProductCubit>();
    _scrollController.addListener(_onScroll);
    cubit.fetchProducts();
  }

  void _onScroll() {
    if (_isBottom) {
      cubit.fetchProducts();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void onTapFavorite() {
    Navigator.pushNamed(context, Routes.favorites);
  }

  void onTapSearch() {
    setState(() {
      _searchBoolean = true;
    });
  }

  void onClearSearch() {
    setState(() {
      _searchBoolean = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: CustomAppBar(
          cubit: cubit,
          searchBoolean: _searchBoolean,
          onSearchTap: onTapSearch,
          onClearSearch: onClearSearch,
          onFavoriteTap: onTapFavorite),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductsLoading || state is SearchLoading) {
            return const AppLoading();
          } else if (state is ProductLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.products.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.products.length) {
                    if (context.read<ProductCubit>().hasMoreData) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: AppLoading(),
                      );
                    } else {
                      return _noDataMore();
                    }
                  } else {
                    final item = state.products[index];
                    return ItemProduct(item: item);
                  }
                },
              ),
            );
          } else if (state is SearchLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: state.products.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final item = state.products[index];
                        return ItemProduct(item: item);
                      },
                    )
                  : Center(
                      child: Text(
                      'No data',
                      style: AppTextStyles.textStyle(fontSize: 16),
                    )),
            );
          }
          return Container();
        },
      ),
    );
  }

  Center _noDataMore() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        'All data has been downloaded',
        style: AppTextStyles.textStyle(color: Colors.grey),
      ),
    ));
  }
}
