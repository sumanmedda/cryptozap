import 'package:cryptozap/model/post_model.dart';

abstract class InternetState {}

class InternetLoadingState extends InternetState {}

class InternetGainedState extends InternetState {
  List<PostModel> posts;
  InternetGainedState(this.posts);
}

class InternetLostState extends InternetState {
  final String error;
  InternetLostState(this.error);
}
