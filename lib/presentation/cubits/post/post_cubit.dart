import 'package:test_burning_bros/data/models/post_model.dart';
import 'package:test_burning_bros/domain/repositories/product_repository.dart';
import 'package:test_burning_bros/presentation/cubits/post/post_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  final ProductRepository postRepository;
  int currentPage = 1;
  List<PostModel> posts = [];
  bool isFetching = false;
  bool hasMoreData = true;

  PostCubit(this.postRepository) : super(PostInitial());

  Future<void> fetchPosts({int? page, int? limit}) async {
    if (isFetching || !hasMoreData) return;
    isFetching = true;

    try {
      if (page == 1) {
        emit(PostsLoading());
      }

      final newPosts =
          await postRepository.fetchPost(page: currentPage, limit: limit ?? 10);
      if (newPosts.isEmpty) {
        hasMoreData = false;
      } else {
        posts.addAll(newPosts);
        print('--------------------------------');
        print(posts.length);
        currentPage++;
      }
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError('$e'));
    } finally {
      isFetching = false;
    }
  }

  Future<void> searchPostById(String query) async {
    try {
      emit(SearchLoading());

      final post = posts.where((p) => p.id.toString() == query).toList();
      if (post.isEmpty) {
        emit(SearchError('No post found with ID: $query'));
      } else {
        emit(SearchLoaded(post));
      }
    } catch (e) {
      emit(SearchError('$e'));
    }
  }
}
