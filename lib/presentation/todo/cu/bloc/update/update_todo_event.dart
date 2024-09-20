part of 'update_todo_bloc.dart';

sealed class UpdateTodoEvent extends Equatable {
  const UpdateTodoEvent();
}

class UpdateTodo extends UpdateTodoEvent {
  final int id;
  final int index;
  final TodoModel model;

  const UpdateTodo(
      {required this.id, required this.index, required this.model});

  @override
  List<Object?> get props => [id, model];
}