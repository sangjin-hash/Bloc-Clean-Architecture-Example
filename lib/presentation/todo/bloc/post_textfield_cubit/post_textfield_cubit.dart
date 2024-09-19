import 'package:bloc/bloc.dart';

///State 정의
class PostTextFieldState {
  late final String field1;
  late final String field2;
  late final String field3;

  PostTextFieldState(
      {required this.field1, required this.field2, required this.field3});

  PostTextFieldState copyWith(
      {String? field1, String? field2, String? field3}) {
    return PostTextFieldState(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      field3: field3 ?? this.field3,
    );
  }
}

///블ㄹ로ㅗㄹ오옭
class PostTextFieldBloc extends Cubit<PostTextFieldState> {
  PostTextFieldBloc()
      : super(PostTextFieldState(field1: '', field2: '', field3: ''));

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
