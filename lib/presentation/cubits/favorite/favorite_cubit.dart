import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/data/models/product_model.dart';
import 'package:test_burning_bros/domain/repositories/favorite_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteCubit(this.favoriteRepository) : super(FavoriteInitial());

  Future<void> addFavorite(ProductItem product) async {
    await favoriteRepository.addToFavorites(product);
    emit(FavoriteAdded(product));
    getFavorites();
  }

  Future<void> removeFavorite(int productId) async {
    await favoriteRepository.removeFromFavorites(productId);
    emit(FavoriteRemoved(productId));
    getFavorites();
  }

  void checkIfFavorite(int productId) {
    final isFav = favoriteRepository.isFavorite(productId);
    emit(FavoriteChecked(productId, isFav));
  }

  Future<void> getFavorites() async {
    final favorites = favoriteRepository.getFavorites();
    emit(FavoritesLoaded(favorites));
  }
}
