import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:library_reservation_liberta_flutter/api/base_api.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {
  final String loginUrl = BaseApi.apiBaseUrl + '/api/Kullanici/giris';
  //final String registerUrl = 'https://reqres.in/api/register';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  // Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
  //   final response = await post(loginUrl, model.toJson());

  //   if (response.statusCode == HttpStatus.ok) {
  //     return LoginResponseModel.fromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }

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
