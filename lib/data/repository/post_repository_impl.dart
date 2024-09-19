import 'package:bloc_clean_architecture_example/core/util/network/exception/network_exception.dart';
import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/data/data_source/remote/post_api.dart';
import 'package:bloc_clean_architecture_example/data/model/post/response/post_response_model.dart';
import 'package:bloc_clean_architecture_example/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostApi api;

  PostRepositoryImpl({required this.api});

  @override
  Future<Result<PostResponseModel>> getPosts() async {
    try {
      var result = await api.getPosts();
      return Result.success(result);
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }
}
