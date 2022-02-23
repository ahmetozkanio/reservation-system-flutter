import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_reservation_liberta_flutter/accounts/login/api/login_api.dart';

import '../../../core/auth_manager.dart';
import '../model/login_request_model.dart';

class LoginController extends GetxController {
  final LoginService _loginService = Get.put(LoginService());
  late final AuthenticationManager _authManager = Get.find();

  TextEditingController tcCtrl = TextEditingController();
  TextEditingController sifreCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginUser(String tc, String sifre) async {
    final response =
        await _loginService.fetchLogin(LoginRequestModel(tc: tc, sifre: sifre));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          title: "Kullanıcı Bulunamadı!",
          middleText: "T.C' nizi veya şifrenizi yanlış.",
          textConfirm: 'Tamam',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  // Future<void> registerUser(String email, String password) async {
  //   final response = await _loginService
  //       .fetchRegister(RegisterRequestModel(email: email, password: password));

  //   if (response != null) {
  //     /// Set isLogin to true
  //     _authManager.login(response.token);
  //   } else {
  //     /// Show user a dialog about the error response
  //     Get.defaultDialog(
  //         middleText: 'Register Error',
  //         textConfirm: 'OK',
  //         confirmTextColor: Colors.white,
  //         onConfirm: () {
  //           Get.back();
  //         });
  //   }
  // }
}
