import 'package:bloc_clean_architecture_example/core/util/network/result/result.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository todoRepository;

  DeleteTodoUseCase({required this.todoRepository});

  Future<Result<void>> execute(int id) async {
    return todoRepository.deleteTodos(id);
  }
}