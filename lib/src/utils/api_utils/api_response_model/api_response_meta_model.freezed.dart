// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_meta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponseMeta _$ApiResponseMetaFromJson(Map<String, dynamic> json) {
  return _ApiResponseMeta.fromJson(json);
}

/// @nodoc
mixin _$ApiResponseMeta {
  int? get code => throw _privateConstructorUsedError;
  ApiResponseStatus? get status => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseMetaCopyWith<ApiResponseMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseMetaCopyWith<$Res> {
  factory $ApiResponseMetaCopyWith(
          ApiResponseMeta value, $Res Function(ApiResponseMeta) then) =
      _$ApiResponseMetaCopyWithImpl<$Res, ApiResponseMeta>;
  @useResult
  $Res call({int? code, ApiResponseStatus? status, dynamic message});
}

/// @nodoc
class _$ApiResponseMetaCopyWithImpl<$Res, $Val extends ApiResponseMeta>
    implements $ApiResponseMetaCopyWith<$Res> {
  _$ApiResponseMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiResponseStatus?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseMetaImplCopyWith<$Res>
    implements $ApiResponseMetaCopyWith<$Res> {
  factory _$$ApiResponseMetaImplCopyWith(_$ApiResponseMetaImpl value,
          $Res Function(_$ApiResponseMetaImpl) then) =
      __$$ApiResponseMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, ApiResponseStatus? status, dynamic message});
}

/// @nodoc
class __$$ApiResponseMetaImplCopyWithImpl<$Res>
    extends _$ApiResponseMetaCopyWithImpl<$Res, _$ApiResponseMetaImpl>
    implements _$$ApiResponseMetaImplCopyWith<$Res> {
  __$$ApiResponseMetaImplCopyWithImpl(
      _$ApiResponseMetaImpl _value, $Res Function(_$ApiResponseMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ApiResponseMetaImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiResponseStatus?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseMetaImpl
    with DiagnosticableTreeMixin
    implements _ApiResponseMeta {
  const _$ApiResponseMetaImpl(
      {required this.code, required this.status, required this.message});

  factory _$ApiResponseMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseMetaImplFromJson(json);

  @override
  final int? code;
  @override
  final ApiResponseStatus? status;
  @override
  final dynamic message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponseMeta(code: $code, status: $status, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponseMeta'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseMetaImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, status, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseMetaImplCopyWith<_$ApiResponseMetaImpl> get copyWith =>
      __$$ApiResponseMetaImplCopyWithImpl<_$ApiResponseMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseMetaImplToJson(
      this,
    );
  }
}

abstract class _ApiResponseMeta implements ApiResponseMeta {
  const factory _ApiResponseMeta(
      {required final int? code,
      required final ApiResponseStatus? status,
      required final dynamic message}) = _$ApiResponseMetaImpl;

  factory _ApiResponseMeta.fromJson(Map<String, dynamic> json) =
      _$ApiResponseMetaImpl.fromJson;

  @override
  int? get code;
  @override
  ApiResponseStatus? get status;
  @override
  dynamic get message;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseMetaImplCopyWith<_$ApiResponseMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
