import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:library_reservation_liberta_flutter/api/base_api.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

class LoginService extends GetConnect {
  final String loginUrl = BaseApi.apiBaseUrl + '/api/user/login';
  // final String loginUrl = 'https://reqres.in/api/login';

  //final String registerUrl = 'https://reqres.in/api/register';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());
    if (response.bodyString != "Kişi bulunamadı") {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  // Future<RegisterResponseModel?> fetchRegister(
  //     RegisterRequestModel model) async {
  //   final response = await post(registerUrl, model.toJson());

  //   if (response.statusCode == HttpStatus.ok) {
  //     return RegisterResponseModel.fromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }
}
