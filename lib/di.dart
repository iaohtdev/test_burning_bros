import 'package:test_burning_bros/core/config/dio_config.dart';
import 'package:test_burning_bros/data/datasources/product_remote_data_source.dart';
import 'package:test_burning_bros/data/repositories/product_repository_impl.dart';
import 'package:test_burning_bros/domain/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio(
        DioConfig.options,
      ));

  //Repository
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt()));

  // Data Source
  getIt.registerLazySingleton<ProductDataSource>(
      () => ProductRemoteDataSourceImpl());
}

Dio get dio => getIt<Dio>();
