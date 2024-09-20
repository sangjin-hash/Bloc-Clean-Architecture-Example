part of 'create_todo_bloc.dart';

sealed class CreateTodoState extends Equatable {
  const CreateTodoState();
}

final class CreateTodoInitial extends CreateTodoState {
  @override
  List<Object> get props => [];
}

final class CreateTodoLoading extends CreateTodoState {
  @override
  List<Object> get props => [];
}

final class CreateTodoSuccess extends CreateTodoState {
  final TodoModel model;

  const CreateTodoSuccess(this.model);

  @override
  List<Object> get props => [model];
}

final class CreateTodoFailure extends CreateTodoState {
  final String errorMessage;

  const CreateTodoFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
