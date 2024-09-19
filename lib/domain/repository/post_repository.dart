import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/data/model/post/response/post_response_model.dart';

abstract class PostRepository {
  Future<Result<PostResponseModel>> getPosts();
}