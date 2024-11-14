import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flounaelza/src/utils/api_utils/api_response_model/api_response_meta_model.dart';

part 'api_response_failed_model.freezed.dart';
part 'api_response_failed_model.g.dart';

@Freezed()
class ApiResponseFailed with _$ApiResponseFailed {
  const factory ApiResponseFailed({
    required ApiResponseMeta? meta,
    required dynamic data,
  }) = _ApiResponseFailed;

  factory ApiResponseFailed.fromJson(
    Map<String, dynamic> json,
  ) => _$ApiResponseFailedFromJson(json);
}