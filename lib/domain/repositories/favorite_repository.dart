import 'package:test_burning_bros/data/models/product_model.dart';

abstract class FavoriteRepository {
  Future<void> addToFavorites(ProductItem product);
  Future<void> removeFromFavorites(int productId);
  bool isFavorite(int productId);
  List<ProductItem> getFavorites();
}
