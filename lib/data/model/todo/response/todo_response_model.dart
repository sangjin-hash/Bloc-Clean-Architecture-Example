import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_response_model.freezed.dart';
part 'todo_response_model.g.dart';

@freezed
class TodoResponseModel with _$TodoResponseModel {
  factory TodoResponseModel(
      {required int userId,
      required int id,
      required String title,
      required bool completed}) = _TodoResponseModel;

  factory TodoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseModelFromJson(json);
}