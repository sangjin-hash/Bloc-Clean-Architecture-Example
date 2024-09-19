import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';
import '../../../core/util/di/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoRepository todoRepository = locator<TodoRepository>();

  TodoListBloc() : super(TodoListInitial()) {
    on<InitializeTodo>((event, emit) async {
      emit(TodoListInitial());
    });

    on<GetTodoList>((event, emit) async {
      emit(TodoListLoading());
      final result = await todoRepository.getTodos();
      result.when(success: (data) {
        return emit(TodoListSuccess(data as List<TodoModel>));
      }, failure: (error) {
        return emit(TodoListError(error));
      });
    });
  }
}

class DeleteTodoBloc extends Bloc<DeleteTodoEvent, DeleteTodoState> {
  DeleteTodoBloc() : super(LoadingDelete()) {
    TodoRepository todoRepository = locator<TodoRepository>();

    on<DeleteTodo>(
      (event, emit) async {
        emit(LoadingDelete());

        final result = await todoRepository.deleteTodos(event.id);
        result.when(
          success: (data) {
            return emit(SuccessDelete());
          },
          failure: (error) {
            return emit(FailDelete(error));
          },
        );
      },
    );
  }
}

class TodoPostBloc extends Bloc<PostTodoEvent, PostTodoState> {
  TodoPostBloc() : super(PostInitial()) {
    TodoRepository todoRepository = locator<TodoRepository>();

    //event가 들어오면 emit state
    on<InitializePost>(
      (event, emit) async {
        return emit(PostInitial());
      },
    );

    on<PostTodoList>((event, emit) async {
      emit(PostLoading());

      final result = await todoRepository.postTodos(event.model);
      result.when(success: (data) {
        return emit(PostSuccess(data));
      }, failure: (error) {
        return emit(PostFailure(error));
      });
    });

    on<PutTodoList>((event, emit) async {
      emit(PostLoading());

      final result = await todoRepository.putTodos(event.model , event.id);
      result.when(success: (data) {
        return emit(PostSuccess(data));
      }, failure: (error) {
        return emit(PostFailure(error));
      });
    });

  }
}
