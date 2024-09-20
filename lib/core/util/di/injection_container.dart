import 'package:bloc_clean_architecture_example/core/util/network/dio/dio_client.dart';
import 'package:bloc_clean_architecture_example/data/data_source/remote/post_api.dart';
import 'package:bloc_clean_architecture_example/data/data_source/remote/todo_api.dart';
import 'package:bloc_clean_architecture_example/data/repository/post_repository_impl.dart';
import 'package:bloc_clean_architecture_example/data/repository/todo_repository_impl.dart';
import 'package:bloc_clean_architecture_example/domain/repository/post_repository.dart';
import 'package:bloc_clean_architecture_example/domain/repository/todo_repository.dart';
import 'package:bloc_clean_architecture_example/domain/usecase/create_todo.dart';
import 'package:bloc_clean_architecture_example/domain/usecase/get_todo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  final dioClient = DioClient.instance;

  /// Todo
  locator.registerLazySingleton<TodoApi>(() => TodoApi(dioClient: dioClient));
  locator.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(api: locator<TodoApi>()));
  locator.registerLazySingleton<CreateTodoUseCase>(
          () => CreateTodoUseCase(todoRepository: locator<TodoRepository>()));
  locator.registerLazySingleton<GetTodoUseCase>(
          () => GetTodoUseCase(todoRepository: locator<TodoRepository>()));
  /// todo: DeleteTodoUseCase, UpdateTodoUseCase


  /// Post
  locator.registerLazySingleton<PostApi>(() => PostApi(dioClient: dioClient));
  locator.registerLazySingleton<PostRepository>(
          () => PostRepositoryImpl(api: locator<PostApi>()));
}
