import 'package:hive/hive.dart';
import 'package:test_burning_bros/data/models/product_model.dart';

abstract class FavoriteLocalDataSource {
  Future<void> addToFavorites(ProductItem product);
  Future<void> removeFromFavorites(int productId);
  bool isFavorite(int productId);
  List<ProductItem> getFavorites();
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final Box<ProductItem> favoritesBox;

  FavoriteLocalDataSourceImpl(this.favoritesBox);

  @override
  Future<void> addToFavorites(ProductItem product) async {
    await favoritesBox.put(product.id, product);
  }

  @override
  Future<void> removeFromFavorites(int productId) async {
    await favoritesBox.delete(productId);
  }

  @override
  bool isFavorite(int productId) {
    return favoritesBox.containsKey(productId);
  }

  @override
  List<ProductItem> getFavorites() {
    return favoritesBox.values.toList();
  }
}
