part of 'todo_bloc.dart';

abstract class TodoListState {}

class TodoListInitial extends TodoListState {}

class TodoListLoading extends TodoListState {}

class TodoListSuccess extends TodoListState {
  late final List<TodoModel> data;

  TodoListSuccess(this.data);
}

class TodoListError extends TodoListState {
  late final String errorMessage;

  TodoListError(this.errorMessage);
}

abstract class DeleteTodoState {}

class LoadingDelete extends DeleteTodoState {}

class SuccessDelete extends DeleteTodoState {}

class FailDelete extends DeleteTodoState {
  late final String errorMessage;

  FailDelete(this.errorMessage);
}

///

abstract class PostTodoState {}

class PostInitial extends PostTodoState {}

class PostLoading extends PostTodoState {}

class PostSuccess extends PostTodoState {
  late final TodoModel data;

  PostSuccess(this.data);
}

class PostFailure extends PostTodoState {
  final String errorMessage;

  PostFailure(this.errorMessage);
}

