import 'package:cryptozap/controller/const/const.dart';
import 'package:cryptozap/controller/repositories/api/api.dart';
import 'package:cryptozap/model/post_model.dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/coins/markets");
      List<dynamic> postMaps = response.data;
      db.put('posts', postMaps);
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
