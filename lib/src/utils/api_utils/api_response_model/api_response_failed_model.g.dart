// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_failed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseFailedImpl _$$ApiResponseFailedImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiResponseFailedImpl(
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'],
    );

Map<String, dynamic> _$$ApiResponseFailedImplToJson(
        _$ApiResponseFailedImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
