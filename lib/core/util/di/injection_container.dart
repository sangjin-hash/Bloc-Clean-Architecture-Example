import 'package:bloc_clean_architecture_example/core/util/network/dio/dio_client.dart';
import 'package:bloc_clean_architecture_example/data/data_source/remote/post_api.dart';
import 'package:bloc_clean_architecture_example/data/data_source/remote/todo_api.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  final dioClient = DioClient.instance;

  /// Todo
  locator.registerLazySingleton<TodoApi>(() => TodoApi(dioClient: dioClient));

  /// Post
  locator.registerLazySingleton<PostApi>(() => PostApi(dioClient: dioClient));
}