import 'package:get/get_connect.dart';
import 'package:flutter/foundation.dart';
import 'package:library_reservation_liberta_flutter/api/base_api.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

class LoginService extends GetConnect {
  final String loginUrl = BaseApi.apiBaseUrl + 'user/login';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    try {
      final response = await post(loginUrl, model.toJson());

      if (response.bodyString != "Kişi bulunamadı") {
        if (response.statusCode == 200) {
          LoginResponseModel loginResponseModel =
              LoginResponseModel.fromJson(response.body);

          if (loginResponseModel.token != null) {
            return loginResponseModel;
          }
        }
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
