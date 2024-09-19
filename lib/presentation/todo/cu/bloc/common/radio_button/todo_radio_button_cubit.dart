import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_example/core/resources/enum_shop.dart';

class TodoRadioButtonCubit extends Cubit<RadioButtonOption?> {
  TodoRadioButtonCubit(super.initial);

  void isCompleted(RadioButtonOption? option) {
    emit(option);
  }
}
