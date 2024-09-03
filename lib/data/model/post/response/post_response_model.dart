import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response_model.freezed.dart';
part 'post_response_model.g.dart';

@freezed
class PostResponseModel with _$PostResponseModel {
  factory PostResponseModel(
      {required int userId,
        required int id,
        required String title,
        required String body}) = _PostResponseModel;

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);
}