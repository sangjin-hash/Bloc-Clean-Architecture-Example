import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';

class UpdateTodoUseCase {
  final TodoRepository todoRepository;

  UpdateTodoUseCase({required this.todoRepository});

  Future<Result<Todo>> execute(Todo entity) async {
    return todoRepository.updateTodos(entity);
  }
}