// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flounaelza/src/constants/env_constant.dart';
import 'package:flounaelza/src/constants/storage_key_constant.dart';
import 'package:flounaelza/src/utils/api_utils/api_response_model/api_response_failed_model.dart';
import 'package:flounaelza/src/utils/api_utils/api_response_model/api_response_meta_model.dart';
import 'package:flounaelza/src/utils/api_utils/api_response_model/api_response_success_model.dart';
import 'package:flounaelza/src/utils/storage_util.dart';

enum ApiRequestType { GET, POST, PUT, DELETE }

class ApiRequestUtil {
  static final Dio _dio = Dio();

  static String _appToken() {
    final userData = StorageUtil.getString(
      key: StorageKeyConstant.USER_DATA,
      useEncryption: true
    );
    if (userData != null) {
      return userData.token ?? EnvConstant.DEFAULT_ACCESS_TOKEN;
    } else {
      return EnvConstant.DEFAULT_ACCESS_TOKEN!;
    }
  }

  static Map<String, dynamic> getDefaultHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_appToken()}',
    };
  }

  static Future<ApiResponseSuccess> request<T>({
    String url = '',
    ApiRequestType type = ApiRequestType.GET,
    Map<String, dynamic>? data,
    Map<String, dynamic>? extraData,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        url,
        data: data,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            ...getDefaultHeaders(),
            if (headers != null) ...headers,
          },
          extra: extraData,
          method: type.toString().split('.').last,
        ),
      );
      if (response.data == null) {
        throw const ApiResponseFailed(meta: null, data: null);
      }

      final codeString = response.statusCode.toString();
      final jsonData = response.data;
      final responseData = ApiResponseSuccess.fromJson(jsonData);

      // If Unauthorized
      if (codeString == '401' || responseData.meta?.code == 401) {
        // await AppStorage.removeUser();
        // NavigationUtils.goToAndRemoveUntil(AppRoutes.LOGIN);
        throw ApiResponseFailed.fromJson(jsonData);
      }

      // If error Code (Non 2xx)
      if (codeString[0] != '2') {
        throw ApiResponseFailed.fromJson(jsonData);
      }

      // If failed returned from BE
      if (responseData.meta?.status != ApiResponseStatus.success) {
        throw ApiResponseFailed.fromJson(jsonData);
      }

      return responseData;
    } catch (e) {
      rethrow;
    }
  }
}
