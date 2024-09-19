import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';

/// interface
abstract class TodoRepository {
  Future<Result<List<TodoModel>>> getTodos();

  Future<Result<TodoModel>> postTodos(TodoModel model);

  Future<Result<TodoModel>> putTodos(TodoModel model, int id);

  Future<Result<void>> deleteTodos(int id);
}
