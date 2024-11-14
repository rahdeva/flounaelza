import 'package:flounaelza/src/constants/env_constant.dart';
import 'package:flounaelza/src/features/auth/models/user_data_model.dart';
import 'package:flounaelza/src/utils/api_utils/api_request_util.dart';
import 'package:flounaelza/src/utils/api_utils/api_response_model/api_response_success_model.dart';

class AuthServices {
  static Future<UserDataModel> postLogin({
    required String email,
    required String password,
  }) async {
    var response = await ApiRequestUtil.request(
      url: '${EnvConstant.BASE_URL}/api/v1/auth/login',
      type: ApiRequestType.POST,
      data: {
        'email': email,
        'password': password,
      },
    );
    
    return UserDataModel.fromJson(response.data);
  }

  static Future<ApiResponseSuccess> postRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }){
    return ApiRequestUtil.request(
      url: '${EnvConstant.BASE_URL}/api/v1/auth/register',
      type: ApiRequestType.POST,
      data: {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );
  }
}