import 'package:bloc/bloc.dart';

///State 정의
enum RadioButtonOption { yes, no }

/// State변환
class PostRadioButtonCubit extends Cubit<RadioButtonOption?> {
  PostRadioButtonCubit(RadioButtonOption? initial) : super(initial);

  void sayYesOrNO(RadioButtonOption? option) {
    emit(option);
  }
}
