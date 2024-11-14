// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseMetaImpl _$$ApiResponseMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiResponseMetaImpl(
      code: (json['code'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$ApiResponseStatusEnumMap, json['status']),
      message: json['message'],
    );

Map<String, dynamic> _$$ApiResponseMetaImplToJson(
        _$ApiResponseMetaImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': _$ApiResponseStatusEnumMap[instance.status],
      'message': instance.message,
    };

const _$ApiResponseStatusEnumMap = {
  ApiResponseStatus.success: 'success',
  ApiResponseStatus.error: 'error',
};
