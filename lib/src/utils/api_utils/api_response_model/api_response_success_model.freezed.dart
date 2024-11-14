// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_success_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponseSuccess _$ApiResponseSuccessFromJson(Map<String, dynamic> json) {
  return _ApiResponseSuccess.fromJson(json);
}

/// @nodoc
mixin _$ApiResponseSuccess {
  ApiResponseMeta? get meta => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseSuccessCopyWith<ApiResponseSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseSuccessCopyWith<$Res> {
  factory $ApiResponseSuccessCopyWith(
          ApiResponseSuccess value, $Res Function(ApiResponseSuccess) then) =
      _$ApiResponseSuccessCopyWithImpl<$Res, ApiResponseSuccess>;
  @useResult
  $Res call({ApiResponseMeta? meta, dynamic data});

  $ApiResponseMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ApiResponseSuccessCopyWithImpl<$Res, $Val extends ApiResponseSuccess>
    implements $ApiResponseSuccessCopyWith<$Res> {
  _$ApiResponseSuccessCopyWithImpl(this._value, this._then);

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
abstract class _$$ApiResponseSuccessImplCopyWith<$Res>
    implements $ApiResponseSuccessCopyWith<$Res> {
  factory _$$ApiResponseSuccessImplCopyWith(_$ApiResponseSuccessImpl value,
          $Res Function(_$ApiResponseSuccessImpl) then) =
      __$$ApiResponseSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiResponseMeta? meta, dynamic data});

  @override
  $ApiResponseMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ApiResponseSuccessImplCopyWithImpl<$Res>
    extends _$ApiResponseSuccessCopyWithImpl<$Res, _$ApiResponseSuccessImpl>
    implements _$$ApiResponseSuccessImplCopyWith<$Res> {
  __$$ApiResponseSuccessImplCopyWithImpl(_$ApiResponseSuccessImpl _value,
      $Res Function(_$ApiResponseSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ApiResponseSuccessImpl(
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
class _$ApiResponseSuccessImpl
    with DiagnosticableTreeMixin
    implements _ApiResponseSuccess {
  const _$ApiResponseSuccessImpl({required this.meta, required this.data});

  factory _$ApiResponseSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseSuccessImplFromJson(json);

  @override
  final ApiResponseMeta? meta;
  @override
  final dynamic data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponseSuccess(meta: $meta, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponseSuccess'))
      ..add(DiagnosticsProperty('meta', meta))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseSuccessImpl &&
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
  _$$ApiResponseSuccessImplCopyWith<_$ApiResponseSuccessImpl> get copyWith =>
      __$$ApiResponseSuccessImplCopyWithImpl<_$ApiResponseSuccessImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseSuccessImplToJson(
      this,
    );
  }
}

abstract class _ApiResponseSuccess implements ApiResponseSuccess {
  const factory _ApiResponseSuccess(
      {required final ApiResponseMeta? meta,
      required final dynamic data}) = _$ApiResponseSuccessImpl;

  factory _ApiResponseSuccess.fromJson(Map<String, dynamic> json) =
      _$ApiResponseSuccessImpl.fromJson;

  @override
  ApiResponseMeta? get meta;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseSuccessImplCopyWith<_$ApiResponseSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
