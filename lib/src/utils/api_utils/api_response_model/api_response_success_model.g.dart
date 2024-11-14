// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_success_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseSuccessImpl _$$ApiResponseSuccessImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiResponseSuccessImpl(
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'],
    );

Map<String, dynamic> _$$ApiResponseSuccessImplToJson(
        _$ApiResponseSuccessImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
