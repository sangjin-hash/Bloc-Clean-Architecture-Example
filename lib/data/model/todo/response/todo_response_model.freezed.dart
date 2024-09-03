// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoResponseModel _$TodoResponseModelFromJson(Map<String, dynamic> json) {
  return _TodoResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TodoResponseModel {
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Serializes this TodoResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoResponseModelCopyWith<TodoResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoResponseModelCopyWith<$Res> {
  factory $TodoResponseModelCopyWith(
          TodoResponseModel value, $Res Function(TodoResponseModel) then) =
      _$TodoResponseModelCopyWithImpl<$Res, TodoResponseModel>;
  @useResult
  $Res call({int userId, int id, String title, bool completed});
}

/// @nodoc
class _$TodoResponseModelCopyWithImpl<$Res, $Val extends TodoResponseModel>
    implements $TodoResponseModelCopyWith<$Res> {
  _$TodoResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoResponseModelImplCopyWith<$Res>
    implements $TodoResponseModelCopyWith<$Res> {
  factory _$$TodoResponseModelImplCopyWith(_$TodoResponseModelImpl value,
          $Res Function(_$TodoResponseModelImpl) then) =
      __$$TodoResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int id, String title, bool completed});
}

/// @nodoc
class __$$TodoResponseModelImplCopyWithImpl<$Res>
    extends _$TodoResponseModelCopyWithImpl<$Res, _$TodoResponseModelImpl>
    implements _$$TodoResponseModelImplCopyWith<$Res> {
  __$$TodoResponseModelImplCopyWithImpl(_$TodoResponseModelImpl _value,
      $Res Function(_$TodoResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_$TodoResponseModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoResponseModelImpl implements _TodoResponseModel {
  _$TodoResponseModelImpl(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory _$TodoResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoResponseModelImplFromJson(json);

  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final bool completed;

  @override
  String toString() {
    return 'TodoResponseModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoResponseModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title, completed);

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoResponseModelImplCopyWith<_$TodoResponseModelImpl> get copyWith =>
      __$$TodoResponseModelImplCopyWithImpl<_$TodoResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoResponseModelImplToJson(
      this,
    );
  }
}

abstract class _TodoResponseModel implements TodoResponseModel {
  factory _TodoResponseModel(
      {required final int userId,
      required final int id,
      required final String title,
      required final bool completed}) = _$TodoResponseModelImpl;

  factory _TodoResponseModel.fromJson(Map<String, dynamic> json) =
      _$TodoResponseModelImpl.fromJson;

  @override
  int get userId;
  @override
  int get id;
  @override
  String get title;
  @override
  bool get completed;

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoResponseModelImplCopyWith<_$TodoResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
