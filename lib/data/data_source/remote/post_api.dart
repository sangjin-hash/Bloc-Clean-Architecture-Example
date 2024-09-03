import 'package:bloc_clean_architecture_example/core/util/network/dio/dio_client.dart';
import 'package:bloc_clean_architecture_example/core/util/network/exception/network_exception.dart';
import 'package:bloc_clean_architecture_example/core/util/network/paths.dart';
import 'package:bloc_clean_architecture_example/data/model/post/response/post_response_model.dart';
import 'package:flutter/material.dart';

class PostApi {
  final String TAG = "[POST_API]";
  final DioClient dioClient;

  PostApi({required this.dioClient});

  /// Read
  Future<PostResponseModel> getPosts() async {
    try {
      final response = await dioClient.get(postUrl);
      return PostResponseModel.fromJson(response);
    } catch (error) {
      debugPrint('$TAG getPosts = $error');
      throw NetworkExceptions.getDioException(error);
    }
  }
}