import 'package:test_burning_bros/core/config/api_config.dart';
import 'package:test_burning_bros/data/models/post_model.dart';
import 'package:test_burning_bros/di.dart';

abstract class PostDataSource {
  Future<List<PostModel>> fetchPost({int? page, int? limit});
}

class DemoRemoteDataSourceImpl implements PostDataSource {
  @override
  Future<List<PostModel>> fetchPost({int? page, int? limit}) async {
    List<PostModel> post = [];
    try {
      final response = await dio.get(
        ApiConfig.products,
        queryParameters: {'skip': page, 'limit': limit},
      );
      if (response.statusCode == 200) {
        for (var i in response.data) {
          post.add(PostModel.fromJson(i));
        }

        return post;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }
}
