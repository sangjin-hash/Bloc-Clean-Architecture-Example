import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';

abstract class TodoRepository {
  Future<Result<List<Todo>>> getTodos();

  Future<Result<Todo>> createTodos(Todo entity);

  Future<Result<Todo>> updateTodos(Todo entity);

  Future<Result<void>> deleteTodos(int id);
}
