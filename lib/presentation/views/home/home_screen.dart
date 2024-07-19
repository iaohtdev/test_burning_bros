import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/data/models/post_model.dart';
import 'package:test_burning_bros/presentation/cubits/post/post_cubit.dart';
import 'package:test_burning_bros/presentation/cubits/post/post_state.dart';
import 'package:test_burning_bros/utils/extensions/app_extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final int _postLimit = 10;
  final TextEditingController _searchController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<PostCubit>().fetchPosts(page: 1, limit: _postLimit);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PostCubit>().fetchPosts(limit: _postLimit);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.posts.length + 1,
              itemBuilder: (context, index) {
                if (index == state.posts.length) {
                  if (context.read<PostCubit>().hasMoreData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text('Đã load hết'));
                  }
                } else {
                  final item = state.posts[index];
                  return _item(index, item);
                }
              },
            );
          } else if (state is PostsError) {
            return Center(child: Text(state.message));
          } else if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final item = state.posts[index];
                return _item(index, item);
              },
            );
          } else if (state is SearchError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }

  Widget _item(int index, PostModel item) {
    return GestureDetector(
      onTap: () => focusNode.unfocusNode(),
      child: Container(
        color: index % 2 == 0 ? Colors.grey : Colors.white,
        child: ListTile(
          title: Center(child: Text(item.id.toString())),
          subtitle: Center(child: Text(item.body.toString())),
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.pink,
      flexibleSpace: Container(),
      title: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          hintText: 'Tìm kiếm...',
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            context.read<PostCubit>().searchPostById(value);
          } else {
            context.read<PostCubit>().fetchPosts(page: 1, limit: _postLimit);
          }
        },
      ),
    );
  }
}
