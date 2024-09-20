import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoRepository todoRepository = locator<TodoRepository>();

  TodoBloc() : super(TodoInitial()) {
    on<GetTodo>(_getTodoRequested);
    on<DeleteTodo>(_deleteTodoRequested);
    on<UpdateTodoCompleted>(_updateTodoCompleted);
  }

  Future<void> _getTodoRequested(GetTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await todoRepository.getTodos();
    result.when(success: (data) {
      return emit(GetTodoSuccess(data));
    }, failure: (error) {
      return emit(TodoFailure(error));
    });
  }

  Future<void> _deleteTodoRequested(
      DeleteTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await todoRepository.deleteTodos(event.id);
    result.when(success: (_) {
      return emit(DeleteTodoSuccess(event.index));
    }, failure: (error) {
      return emit(TodoFailure(error));
    });
  }

  Future<void> _updateTodoCompleted(
      UpdateTodoCompleted event, Emitter<TodoState> emit) async {
    emit(UpdateTodoDone(event.index, event.model));
  }
}
