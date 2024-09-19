import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';

/// interface
abstract class TodoRepository {
  Future<Result<List<TodoModel>>> getTodos();

  Future<Result<TodoModel>> createTodos(TodoModel model);

  Future<Result<TodoModel>> updateTodos(int id, TodoModel model);

  Future<Result<void>> deleteTodos(int id);
}
