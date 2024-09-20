import 'package:bloc_clean_architecture_example/data/model/todo/todo_model.dart';
import 'package:bloc_clean_architecture_example/domain/entity/todo.dart';

class DataTodoMapper {
  /// Entity -> Model
  TodoModel toTodoModel(Todo entity) {
    return TodoModel(
        userId: entity.userId,
        id: entity.id,
        title: entity.title,
        completed: entity.completed);
  }

  /// Model -> Entity
  Todo mapTodoModelToEntity(TodoModel model) {
    return Todo(
        userId: model.userId,
        id: model.id,
        title: model.title,
        completed: model.completed);
  }

  /// List<Model> -> List<Entity>
  List<Todo> mapTodoModelListToEntity(List<TodoModel> model) {
    return model.map((todoModel) => mapTodoModelToEntity(todoModel)).toList();
  }
}
