// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_failed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponseFailed _$ApiResponseFailedFromJson(Map<String, dynamic> json) {
  return _ApiResponseFailed.fromJson(json);
}

/// @nodoc
mixin _$ApiResponseFailed {
  ApiResponseMeta? get meta => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseFailedCopyWith<ApiResponseFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseFailedCopyWith<$Res> {
  factory $ApiResponseFailedCopyWith(
          ApiResponseFailed value, $Res Function(ApiResponseFailed) then) =
      _$ApiResponseFailedCopyWithImpl<$Res, ApiResponseFailed>;
  @useResult
  $Res call({ApiResponseMeta? meta, dynamic data});

  $ApiResponseMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ApiResponseFailedCopyWithImpl<$Res, $Val extends ApiResponseFailed>
    implements $ApiResponseFailedCopyWith<$Res> {
  _$ApiResponseFailedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ApiResponseMeta?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiResponseMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ApiResponseMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseFailedImplCopyWith<$Res>
    implements $ApiResponseFailedCopyWith<$Res> {
  factory _$$ApiResponseFailedImplCopyWith(_$ApiResponseFailedImpl value,
          $Res Function(_$ApiResponseFailedImpl) then) =
      __$$ApiResponseFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiResponseMeta? meta, dynamic data});

  @override
  $ApiResponseMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ApiResponseFailedImplCopyWithImpl<$Res>
    extends _$ApiResponseFailedCopyWithImpl<$Res, _$ApiResponseFailedImpl>
    implements _$$ApiResponseFailedImplCopyWith<$Res> {
  __$$ApiResponseFailedImplCopyWithImpl(_$ApiResponseFailedImpl _value,
      $Res Function(_$ApiResponseFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ApiResponseFailedImpl(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ApiResponseMeta?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseFailedImpl
    with DiagnosticableTreeMixin
    implements _ApiResponseFailed {
  const _$ApiResponseFailedImpl({required this.meta, required this.data});

  factory _$ApiResponseFailedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseFailedImplFromJson(json);

  @override
  final ApiResponseMeta? meta;
  @override
  final dynamic data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponseFailed(meta: $meta, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponseFailed'))
      ..add(DiagnosticsProperty('meta', meta))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseFailedImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, meta, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseFailedImplCopyWith<_$ApiResponseFailedImpl> get copyWith =>
      __$$ApiResponseFailedImplCopyWithImpl<_$ApiResponseFailedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseFailedImplToJson(
      this,
    );
  }
}

abstract class _ApiResponseFailed implements ApiResponseFailed {
  const factory _ApiResponseFailed(
      {required final ApiResponseMeta? meta,
      required final dynamic data}) = _$ApiResponseFailedImpl;

  factory _ApiResponseFailed.fromJson(Map<String, dynamic> json) =
      _$ApiResponseFailedImpl.fromJson;

  @override
  ApiResponseMeta? get meta;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseFailedImplCopyWith<_$ApiResponseFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
