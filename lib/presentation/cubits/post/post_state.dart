import 'package:test_burning_bros/data/models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostsLoading extends PostState {}

class PostsLoaded extends PostState {
  final List<PostModel> posts;

  PostsLoaded(this.posts);
}

class PostsError extends PostState {
  final String message;

  PostsError(this.message);
}

class SearchLoading extends PostState {}

class SearchLoaded extends PostState {
  final List<PostModel> posts;
  SearchLoaded(this.posts);
}

class SearchError extends PostState {
  final String message;
  SearchError(this.message);
}
