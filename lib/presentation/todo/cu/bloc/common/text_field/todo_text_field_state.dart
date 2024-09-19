import 'package:equatable/equatable.dart';

class TodoTextFieldState extends Equatable {
  final String field1;
  final String field2;
  final String field3;

  const TodoTextFieldState(
      {required this.field1, required this.field2, required this.field3});

  TodoTextFieldState copyWith(
      {String? field1, String? field2, String? field3}) {
    return TodoTextFieldState(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      field3: field3 ?? this.field3,
    );
  }

  @override
  List<Object?> get props => [field1, field2, field3];
}