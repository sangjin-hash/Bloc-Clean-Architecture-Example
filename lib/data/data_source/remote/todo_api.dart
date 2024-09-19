import 'package:bloc_clean_architecture_example/core/util/network/dio/dio_client.dart';
import 'package:bloc_clean_architecture_example/core/util/network/exception/network_exception.dart';
import 'package:bloc_clean_architecture_example/core/util/network/paths.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:flutter/material.dart';

class TodoApi {
  final String TAG = "[TODO_API]";
  final DioClient dioClient;

  TodoApi({required this.dioClient});

  /// Create
  Future<TodoModel> createTodos(TodoModel model) async {
    try {
      final response =
          await DioClient.instance.post(todoUrl, data: model.toJson());
      return TodoModel.fromJson(response);
    } catch (error) {
      debugPrint('$TAG getTodos = $error');
      throw NetworkExceptions.getDioException(error);
    }
  }

  /// Read
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await dioClient.get(todoUrl);
      List<TodoModel> models = [];
      for (var value in response) {
        TodoModel model = TodoModel.fromJson(value);
        models.add(model);
      }
      return models;
    } catch (error) {
      debugPrint('$TAG getTodos = $error');
      throw NetworkExceptions.getDioException(error);
    }
  }

  /// Update
  Future<TodoModel> updateTodos(int id, TodoModel model) async {
    try {
      final response =
      await DioClient.instance.put("$todoUrl/$id", data: model.toJson());
      return TodoModel.fromJson(response);
    } catch (error) {
      debugPrint('$TAG getTodos = $error');
      throw NetworkExceptions.getDioException(error);
    }
  }
  /// Delete
  Future<void> deleteTodos(int id) async{
    try{
      await dioClient.delete("$todoUrl/$id");
    }catch (error) {
      debugPrint('$TAG getTodos = $error');
      throw NetworkExceptions.getDioException(error);
    }
  }
}
