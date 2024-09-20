import 'package:bloc_clean_architecture_example/core/util/network/exception/network_exception.dart';
import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/data/data_source/remote/todo_api.dart';
import 'package:bloc_clean_architecture_example/data/mapper/data_todo_mapper.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoApi api;
  final mapper = DataTodoMapper();

  TodoRepositoryImpl({required this.api});

  /// Create
  @override
  Future<Result<Todo>> createTodos(Todo entity) async {
    try {
      final data = await api.createTodos(mapper.toTodoModel(entity));
      return Result.success(mapper.mapTodoModelToEntity(data));
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }

  /// Read
  @override
  Future<Result<List<Todo>>> getTodos() async {
    try {
      var data = await api.getTodos();
      return Result.success(mapper.mapTodoModelListToEntity(data));
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }

  /// Update
  @override
  Future<Result<Todo>> updateTodos(Todo entity) async {
    try {
      final data = await api.updateTodos(mapper.toTodoModel(entity));
      return Result.success(mapper.mapTodoModelToEntity(data));
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }

  /// Delete
  @override
  Future<Result<void>> deleteTodos(int id) async {
    try {
      await api.deleteTodos(id);
      return const Result.success(null);
    } catch (error) {
      return Result.failure(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }
}
