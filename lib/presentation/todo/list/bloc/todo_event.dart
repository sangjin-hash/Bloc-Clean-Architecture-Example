part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class GetTodo extends TodoEvent {
  const GetTodo();

  @override
  List<Object?> get props => [];
}

class DeleteTodo extends TodoEvent {
  final int id;
  final int index;

  const DeleteTodo({required this.id, required this.index});

  @override
  List<Object?> get props => [id];
}

class UpdateTodoCompleted extends TodoEvent {
  final int index;
  final Todo entity;

  const UpdateTodoCompleted(this.index, this.entity);

  @override
  List<Object?> get props => [index, entity];
}
class CreateTodoCompleted extends TodoEvent {
  final Todo entity;

  const CreateTodoCompleted(this.entity);

  @override
  List<Object?> get props => [entity];
}