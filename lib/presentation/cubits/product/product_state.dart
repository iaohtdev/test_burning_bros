import 'package:test_burning_bros/data/models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductItem> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

class SearchLoading extends ProductState {}

class SearchLoaded extends ProductState {
  final List<ProductItem> products;
  SearchLoaded(this.products);
}

class SearchError extends ProductState {
  final String message;
  SearchError(this.message);
}
