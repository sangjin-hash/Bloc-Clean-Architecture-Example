import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/domain/usecase/update_todo.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/mapper/view_todo_mapper.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/param/todo_param.dart';
import 'package:equatable/equatable.dart';

part 'update_todo_event.dart';
part 'update_todo_state.dart';

class UpdateTodoBloc extends Bloc<UpdateTodoEvent, UpdateTodoState> {
  UpdateTodoUseCase updateUseCase = locator< UpdateTodoUseCase>();
  final mapper = ViewTodoMapper();


  UpdateTodoBloc() : super(UpdateTodoInitial()) {
    on<UpdateTodo>(_updateTodoRequested);
  }

  Future<void> _updateTodoRequested(
      UpdateTodo event, Emitter<UpdateTodoState> emit) async {
    emit(UpdateTodoLoading());
    final result = await updateUseCase.execute(mapper.mapTodoParamToEntity(event.param));
    result.when(success: (data) {
      return emit(UpdateTodoSuccess(event.index, data));
    }, failure: (error) {
      return emit(UpdateTodoFailure(error));
    });
  }
}
