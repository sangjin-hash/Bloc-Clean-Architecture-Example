import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'update_todo_event.dart';
part 'update_todo_state.dart';

class UpdateTodoBloc extends Bloc<UpdateTodoEvent, UpdateTodoState> {
  TodoRepository todoRepository = locator<TodoRepository>();

  UpdateTodoBloc() : super(UpdateTodoInitial()) {
    on<UpdateTodo>(_updateTodoRequested);
  }

  Future<void> _updateTodoRequested(
      UpdateTodo event, Emitter<UpdateTodoState> emit) async {
    emit(UpdateTodoLoading());
    final result = await todoRepository.updateTodos(event.id, event.model);
    result.when(success: (data) {
      return emit(UpdateTodoSuccess(event.index, data));
    }, failure: (error) {
      return emit(UpdateTodoFailure(error));
    });
  }
}
