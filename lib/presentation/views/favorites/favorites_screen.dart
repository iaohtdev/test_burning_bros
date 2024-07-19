import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/core/theme/app_color.dart';
import 'package:test_burning_bros/core/theme/app_textstyle.dart';
import 'package:test_burning_bros/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:test_burning_bros/presentation/views/home/components/item_product.dart';
import 'package:test_burning_bros/presentation/widgets/app_loading.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          'Favorite Products',
          style: AppTextStyles.textStyleBold(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteInitial) {
            return const AppLoading();
          } else if (state is FavoritesLoaded) {
            if (state.favorites.isEmpty) {
              return Center(
                child: Text(
                  'No favorites yet.',
                  style:
                      AppTextStyles.textStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final item = state.favorites[index];
                  return ItemProduct(item: item);
                },
              ),
            );
          } else {
            return const Center(child: Text('An error occurred'));
          }
        },
      ),
    );
  }
}
