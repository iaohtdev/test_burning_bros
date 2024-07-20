import 'package:test_burning_bros/core/network/network_infor.dart';
import 'package:test_burning_bros/data/models/product_model.dart';
import 'package:test_burning_bros/domain/repositories/product_repository.dart';
import 'package:test_burning_bros/presentation/cubits/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/presentation/widgets/app_toast.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  final NetworkInfo networkInfo;
  int currentPage = 1;
  List<ProductItem> products = [];
  bool isFetching = false;
  bool hasMoreData = true;
  final int _productLimit = 20;

  ProductCubit(this.productRepository, this.networkInfo)
      : super(ProductInitial());

  Future<void> fetchProducts() async {
    if (isFetching || !hasMoreData) return;

    if (!(await networkInfo.isConnected)) {
      AppToast.show('No internet connection');
      return;
    }

    isFetching = true;

    try {
      if (currentPage == 1) {
        emit(ProductsLoading());
      }

      final response = await productRepository.fetchProduct(
        page: currentPage,
        limit: _productLimit,
      );

      if (response.products != null && response.products!.isEmpty) {
        hasMoreData = false;
      } else {
        if (products.length + response.products!.length >=
            (response.total ?? 0)) {
          hasMoreData = false;
        }

        products.addAll(response.products ?? []);
        currentPage++;
      }

      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('$e'));
    } finally {
      isFetching = false;
    }
  }

  Future<void> searchProducts(String query) async {
    if (!(await networkInfo.isConnected)) {
      AppToast.show('No internet connection');
      return;
    }

    emit(SearchLoading());
    try {
      final result = await productRepository.search(query: query);
      emit(SearchLoaded(result));
    } catch (e) {
      emit(SearchError('$e'));
    }
  }
}
