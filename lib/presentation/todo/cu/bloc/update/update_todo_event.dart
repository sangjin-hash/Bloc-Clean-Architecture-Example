part of 'update_todo_bloc.dart';

sealed class UpdateTodoEvent extends Equatable {
  const UpdateTodoEvent();
}

class UpdateTodo extends UpdateTodoEvent {
  final int id;
  final int index;
  final TodoParam param;

  const UpdateTodo(
      {required this.id, required this.index, required this.param});

  @override
  List<Object?> get props => [id, index, param];
}
