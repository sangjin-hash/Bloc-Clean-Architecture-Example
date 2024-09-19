part of 'create_todo_bloc.dart';

sealed class CreateTodoEvent extends Equatable {
  const CreateTodoEvent();
}

class CreateTodo extends CreateTodoEvent {
  final TodoModel model;
  const CreateTodo(this.model);

  @override
  List<Object?> get props => [model];
}