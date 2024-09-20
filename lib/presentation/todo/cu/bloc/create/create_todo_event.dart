part of 'create_todo_bloc.dart';

sealed class CreateTodoEvent extends Equatable {
  const CreateTodoEvent();
}

class CreateTodo extends CreateTodoEvent {
  final TodoParam param;

  const CreateTodo(this.param);

  @override
  List<Object?> get props => [param];
}
