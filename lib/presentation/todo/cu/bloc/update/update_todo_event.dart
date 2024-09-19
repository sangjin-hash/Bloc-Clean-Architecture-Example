part of 'update_todo_bloc.dart';

sealed class UpdateTodoEvent extends Equatable {
  const UpdateTodoEvent();
}

class UpdateTodo extends UpdateTodoEvent {
  final int id;
  final TodoModel model;
  const UpdateTodo(this.id, this.model);

  @override
  List<Object?> get props => [id, model];
}