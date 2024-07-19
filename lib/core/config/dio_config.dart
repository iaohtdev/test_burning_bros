import 'package:dio/dio.dart';
import 'package:test_burning_bros/core/config/base_url.dart';

class DioConfig {
  static BaseOptions options = BaseOptions(
    baseUrl: BaseUrl.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    queryParameters: {'language': 'vi'},
  );
}
