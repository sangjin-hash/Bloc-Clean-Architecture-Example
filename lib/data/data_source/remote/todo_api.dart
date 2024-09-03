import 'package:bloc_clean_architecture_example/core/util/network/dio/dio_client.dart';
import 'package:bloc_clean_architecture_example/core/util/network/exception/network_exception.dart';
import 'package:bloc_clean_architecture_example/core/util/network/paths.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/response/todo_response_model.dart';
import 'package:flutter/material.dart';

class TodoApi {
  final String TAG = "[TODO_API]";
  final DioClient dioClient;

  TodoApi({required this.dioClient});

  /// Read
  Future<TodoResponseModel> getTodos() async {
    try {
      final response = await dioClient.get(todoUrl);
      return TodoResponseModel.fromJson(response);
    } catch (error) {
      debugPrint('$TAG getTodos = $error');
      throw NetworkExceptions.getDioException(error);
    }
  }
}