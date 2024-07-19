import 'package:test_burning_bros/data/datasources/favorite_remote_data_source.dart';
import 'package:test_burning_bros/data/models/product_model.dart';
import 'package:test_burning_bros/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<void> addToFavorites(ProductItem product) async {
    await localDataSource.addToFavorites(product);
  }

  @override
  Future<void> removeFromFavorites(int productId) async {
    await localDataSource.removeFromFavorites(productId);
  }

  @override
  bool isFavorite(int productId) {
    return localDataSource.isFavorite(productId);
  }

  @override
  List<ProductItem> getFavorites() {
    return localDataSource.getFavorites();
  }
}
