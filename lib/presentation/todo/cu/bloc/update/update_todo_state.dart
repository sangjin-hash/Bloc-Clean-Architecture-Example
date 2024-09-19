part of 'update_todo_bloc.dart';

sealed class UpdateTodoState extends Equatable {
  const UpdateTodoState();
}

final class UpdateTodoInitial extends UpdateTodoState {
  @override
  List<Object> get props => [];
}

final class UpdateTodoLoading extends UpdateTodoState {
  @override
  List<Object> get props => [];
}

final class UpdateTodoSuccess extends UpdateTodoState {
  final TodoModel data;

  const UpdateTodoSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class UpdateTodoFailure extends UpdateTodoState {
  final String errorMessage;

  const UpdateTodoFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

