import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/presentation/todo/cu/bloc/common/text_field/todo_text_field_state.dart';

class TodoTextFieldCubit extends Cubit<TodoTextFieldState> {
  TodoTextFieldCubit()
      : super(const TodoTextFieldState(field1: '', field2: '', field3: ''));

  void updateField1(String value) {
    emit(state.copyWith(field1: value));
  }

  void updateField2(String value) {
    emit(state.copyWith(field2: value));
  }

  void updateField3(String value) {
    emit(state.copyWith(field3: value));
  }
}
