// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostResponseModel _$PostResponseModelFromJson(Map<String, dynamic> json) {
  return _PostResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PostResponseModel {
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  /// Serializes this PostResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostResponseModelCopyWith<PostResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostResponseModelCopyWith<$Res> {
  factory $PostResponseModelCopyWith(
          PostResponseModel value, $Res Function(PostResponseModel) then) =
      _$PostResponseModelCopyWithImpl<$Res, PostResponseModel>;
  @useResult
  $Res call({int userId, int id, String title, String body});
}

/// @nodoc
class _$PostResponseModelCopyWithImpl<$Res, $Val extends PostResponseModel>
    implements $PostResponseModelCopyWith<$Res> {
  _$PostResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? body = null,
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
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostResponseModelImplCopyWith<$Res>
    implements $PostResponseModelCopyWith<$Res> {
  factory _$$PostResponseModelImplCopyWith(_$PostResponseModelImpl value,
          $Res Function(_$PostResponseModelImpl) then) =
      __$$PostResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int id, String title, String body});
}

/// @nodoc
class __$$PostResponseModelImplCopyWithImpl<$Res>
    extends _$PostResponseModelCopyWithImpl<$Res, _$PostResponseModelImpl>
    implements _$$PostResponseModelImplCopyWith<$Res> {
  __$$PostResponseModelImplCopyWithImpl(_$PostResponseModelImpl _value,
      $Res Function(_$PostResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_$PostResponseModelImpl(
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
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostResponseModelImpl implements _PostResponseModel {
  _$PostResponseModelImpl(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory _$PostResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostResponseModelImplFromJson(json);

  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'PostResponseModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostResponseModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title, body);

  /// Create a copy of PostResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostResponseModelImplCopyWith<_$PostResponseModelImpl> get copyWith =>
      __$$PostResponseModelImplCopyWithImpl<_$PostResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PostResponseModel implements PostResponseModel {
  factory _PostResponseModel(
      {required final int userId,
      required final int id,
      required final String title,
      required final String body}) = _$PostResponseModelImpl;

  factory _PostResponseModel.fromJson(Map<String, dynamic> json) =
      _$PostResponseModelImpl.fromJson;

  @override
  int get userId;
  @override
  int get id;
  @override
  String get title;
  @override
  String get body;

  /// Create a copy of PostResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostResponseModelImplCopyWith<_$PostResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
