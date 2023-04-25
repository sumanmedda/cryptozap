import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/post_model.dart';
import '../../repositories/post_repository.dart';
import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  PostRepository postRepository = PostRepository();

  InternetCubit() : super(InternetLoadingState()) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        List<PostModel> posts = await postRepository.fetchPosts();
        emit(InternetGainedState(posts));
      } else {
        emit(InternetLostState('Not Connected To Internet'));
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
