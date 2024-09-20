import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/domain/usecase/delete_todo.dart';
import 'package:bloc_clean_architecture_example/domain/usecase/get_todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  GetTodoUseCase useCase = locator<GetTodoUseCase>();
  DeleteTodoUseCase deleteUseCase = locator<DeleteTodoUseCase>();


  TodoBloc() : super(TodoInitial()) {
    on<GetTodo>(_getTodoRequested);
    on<DeleteTodo>(_deleteTodoRequested);
    on<UpdateTodoCompleted>(_updateTodoCompleted);
    on<CreateTodoCompleted>(_createTodoCompleted);
  }

  Future<void> _getTodoRequested(GetTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await useCase.execute();
    result.when(success: (data) {
      return emit(GetTodoSuccess(data));
    }, failure: (error) {
      return emit(TodoFailure(error));
    });
  }

  Future<void> _deleteTodoRequested(
      DeleteTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await deleteUseCase.execute(event.id);
    result.when(success: (_) {
      return emit(DeleteTodoSuccess(event.index));
    }, failure: (error) {
      return emit(TodoFailure(error));
    });
  }

  Future<void> _updateTodoCompleted(
      UpdateTodoCompleted event, Emitter<TodoState> emit) async {
    emit(UpdateTodoDone(event.index, event.entity));
  }

  Future<void> _createTodoCompleted(
      CreateTodoCompleted event, Emitter<TodoState> emit) async {
    emit(CreateTodoDone(event.entity));
  }
}
