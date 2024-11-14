import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'api_response_meta_model.freezed.dart';
part 'api_response_meta_model.g.dart';

enum ApiResponseStatus { success, error }

@freezed
class ApiResponseMeta with _$ApiResponseMeta {
  const factory ApiResponseMeta({
    required int? code,
    required ApiResponseStatus? status,
    required dynamic message,
  }) = _ApiResponseMeta;

  factory ApiResponseMeta.fromJson(Map<String, Object?> json)
      => _$ApiResponseMetaFromJson(json);
}
