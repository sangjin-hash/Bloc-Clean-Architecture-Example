// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoResponseModelImpl _$$TodoResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TodoResponseModelImpl(
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$TodoResponseModelImplToJson(
        _$TodoResponseModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
