import 'package:test_burning_bros/data/models/product_model.dart';

abstract class ProductRepository {
  Future<ProductModel> fetchProduct({int? page, int? limit});
  Future<List<ProductItem>> search({
    String? query,
  });
}
