import 'package:test_burning_bros/data/datasources/product_remote_data_source.dart';
import 'package:test_burning_bros/data/models/product_model.dart';
import 'package:test_burning_bros/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource remoteDataSource;
  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProductModel> fetchProduct({int? page, int? limit}) async {
    return await remoteDataSource.fetchProduct(page: page, limit: limit);
  }

  @override
  Future<List<ProductItem>> search({String? query}) async {
    return await remoteDataSource.search(query: query);
  }
}
