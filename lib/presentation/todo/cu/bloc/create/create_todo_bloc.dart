import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/core/util/di/injection_container.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/domain/usecase/create_todo.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/mapper/view_todo_mapper.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/param/create_todo_param.dart';
import 'package:equatable/equatable.dart';

part 'create_todo_event.dart';

part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoUseCase useCase = locator<CreateTodoUseCase>();
  final mapper = ViewTodoMapper();

  CreateTodoBloc() : super(CreateTodoInitial()) {
    on<CreateTodo>(_createTodoRequested);
  }

  Future<void> _createTodoRequested(
      CreateTodo event, Emitter<CreateTodoState> emit) async {
    emit(CreateTodoLoading());
    final result =
        await useCase.execute(mapper.mapCreateTodoParamToEntity(event.param));
    result.when(success: (data) {
      return emit(CreateTodoSuccess(data));
    }, failure: (error) {
      return emit(CreateTodoFailure(error));
    });
  }
}
