import 'package:test_burning_bros/data/models/post_model.dart';

abstract class ProductRepository {
  Future<List<PostModel>> fetchPost({int? page, int? limit});
}
