import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flounaelza/src/utils/api_utils/api_response_model/api_response_meta_model.dart';

part 'api_response_success_model.freezed.dart';
part 'api_response_success_model.g.dart';

@Freezed()
class ApiResponseSuccess with _$ApiResponseSuccess {
  const factory ApiResponseSuccess({
    required ApiResponseMeta? meta,
    required dynamic data,
  }) = _ApiResponseSuccess;

  factory ApiResponseSuccess.fromJson(
    Map<String, dynamic> json,
  ) => _$ApiResponseSuccessFromJson(json);
}