import 'package:bloc_clean_architecture_example/core/util/network/exception/network_exception.dart';
import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/data/data_source/remote/todo_api.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoApi api;

  TodoRepositoryImpl({required this.api});

  /// Create
  @override
  Future<Result<TodoModel>> createTodos(TodoModel model) async {
    try {
      final data = await api.createTodos(model);
      return Result.success(data);
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }

  /// Read
  @override
  Future<Result<List<TodoModel>>> getTodos() async {
    try {
      var result = await api.getTodos();
      return Result.success(result);
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }

  /// Update
  @override
  Future<Result<TodoModel>> updateTodos(int id, TodoModel model) async {
    try {
      final data = await api.updateTodos(id, model);
      return Result.success(data);
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }

  /// Delete
  @override
  Future<Result<void>> deleteTodos(int id) async{
    try{
      await api.deleteTodos(id);
      return const Result.success(null);
    }catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }
}
