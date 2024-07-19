import 'package:test_burning_bros/data/datasources/post_remote_data_source.dart';
import 'package:test_burning_bros/data/models/post_model.dart';
import 'package:test_burning_bros/domain/repositories/product_repository.dart';

class PostRepositoryImpl implements ProductRepository {
  final PostDataSource remoteDataSource;
  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PostModel>> fetchPost({int? page, int? limit}) async {
    return await remoteDataSource.fetchPost(page: page, limit: limit);
  }
}
