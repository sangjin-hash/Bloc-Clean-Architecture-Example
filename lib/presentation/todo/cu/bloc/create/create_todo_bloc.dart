import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  TodoRepository todoRepository = locator<TodoRepository>();

  CreateTodoBloc() : super(CreateTodoInitial()) {
    on<CreateTodo>(_createTodoRequested);
  }

  Future<void> _createTodoRequested(
      CreateTodo event, Emitter<CreateTodoState> emit) async {
    emit(CreateTodoLoading());
    final result = await todoRepository.createTodos(event.model);
    result.when(success: (data) {
      return emit(CreateTodoSuccess(data));
    }, failure: (error) {
      return emit(CreateTodoFailure(error));
    });
  }
}
