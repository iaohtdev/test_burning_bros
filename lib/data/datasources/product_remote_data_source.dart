import 'package:test_burning_bros/core/config/api_config.dart';
import 'package:test_burning_bros/data/models/product_model.dart';
import 'package:test_burning_bros/di.dart';

abstract class ProductDataSource {
  Future<ProductModel> fetchProduct({int? page, int? limit});
  Future<List<ProductItem>> search({
    String? query,
  });
}

class ProductRemoteDataSourceImpl implements ProductDataSource {
  @override
  Future<ProductModel> fetchProduct({int? page, int? limit}) async {
    ProductModel productModel;
    try {
      final response = await dio.get(
        ApiConfig.products,
        queryParameters: {'skip': page, 'limit': limit},
      );
      if (response.statusCode == 200) {
        productModel = ProductModel.fromJson(response.data);
        return productModel;
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ProductItem>> search({String? query}) async {
    List<ProductItem> products = [];
    try {
      final response = await dio.get(
        ApiConfig.search,
        queryParameters: {'q': query},
      );
      if (response.statusCode == 200) {
        for (var i in response.data['products']) {
          products.add(ProductItem.fromJson(i));
        }

        return products;
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
