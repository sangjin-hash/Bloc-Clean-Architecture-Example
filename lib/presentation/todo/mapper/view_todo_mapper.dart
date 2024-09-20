import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/param/todo_param.dart';

class ViewTodoMapper {
  Todo mapTodoParamToEntity(TodoParam param) {
    return Todo(
        id: param.id!,
        userId: param.userId!,
        title: param.title!,
        completed: param.completed!);
  }
}
