import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';

class GetTodoUseCase {
  final TodoRepository todoRepository;

  GetTodoUseCase({required this.todoRepository});

  Future<Result<List<Todo>>> execute() async {
    return todoRepository.getTodos();
  }
}