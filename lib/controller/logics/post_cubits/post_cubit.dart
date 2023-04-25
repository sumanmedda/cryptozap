import 'package:cryptozap/controller/logics/post_cubits/post_state.dart';
import 'package:cryptozap/controller/repositories/post_repository.dart';
import 'package:cryptozap/model/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPost();
  }

  PostRepository postRepository = PostRepository();

  fetchPost() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } on DioError catch (e) {
      emit(PostErrorState(e.message.toString()));
    }
  }
}
