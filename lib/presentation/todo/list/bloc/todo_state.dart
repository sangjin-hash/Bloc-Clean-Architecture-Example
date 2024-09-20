part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();
}

final class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

final class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

final class GetTodoSuccess extends TodoState {
  final List<Todo> data;

  const GetTodoSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class DeleteTodoSuccess extends TodoState {
  final int index;

  const DeleteTodoSuccess(this.index);

  @override
  List<Object> get props => [index];
}

final class UpdateTodoDone extends TodoState {
  final int index;
  final Todo entity;

  const UpdateTodoDone(this.index, this.entity);

  @override
  List<Object?> get props => [index, entity];
}

final class CreateTodoDone extends TodoState {
  final Todo entity;

  const CreateTodoDone(this.entity);

  @override
  List<Object?> get props => [entity];
}

final class TodoFailure extends TodoState {
  final String errorMessage;

  const TodoFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
