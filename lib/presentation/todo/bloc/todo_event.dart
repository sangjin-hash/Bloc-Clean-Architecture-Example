part of 'todo_bloc.dart';

abstract class TodoListEvent {
  const TodoListEvent();
}

class InitializeTodo extends TodoListEvent {
  const InitializeTodo();
}

class GetTodoList extends TodoListEvent {
  const GetTodoList();
}

///delete
class DeleteTodoEvent {
  const DeleteTodoEvent();
}

class DeleteTodo extends DeleteTodoEvent {
  final int id;

  const DeleteTodo(this.id);
}

///

abstract class PostTodoEvent {
  const PostTodoEvent();
}

class InitializePost extends PostTodoEvent {
  const InitializePost();
}

class PostTodoList extends PostTodoEvent {
  final TodoModel model;
  const PostTodoList(this.model);
}

class PutTodoList extends PostTodoEvent {
  final TodoModel model;
  final int id;
  const PutTodoList(this.model, this.id);
}