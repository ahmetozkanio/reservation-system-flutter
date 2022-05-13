import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_reservation_liberta_flutter/accounts/login/api/login_api.dart';
import 'package:library_reservation_liberta_flutter/home/splash_view.dart';
import 'package:library_reservation_liberta_flutter/widgets/snackbar.dart';

import '../../../core/login/auth_manager.dart';
import '../model/login_request_model.dart';

class LoginController extends GetxController {
  final LoginService _loginService = Get.put(LoginService());
  late final AuthenticationManager _authManager =
      Get.find(); //Getx auth manager bulup getirme.

  TextEditingController emailCtrl =
      TextEditingController(); // LoginView EmailText
  TextEditingController sifreCtrl =
      TextEditingController(); // LoginView sifreText

  var loginButtonLoading = false.obs; //giris butonu circle kontrol islemi.

  Future<void> loginUser(String email, String sifre) async {
    loginButtonLoading.value = true;
    final response = await _loginService.fetchLogin(LoginRequestModel(
        email: email, sifre: sifre)); //Servis islemi ve gelen veri.

    if (response != null) {
      _authManager.login(
        response.token,
        response.userId,
        response.email,
        response.role,
      ); //Veriler cache kayit edilme islemi.
      loginButtonLoading.value = false;
      Get.offAll(() =>
          SplashView()); //splashView bastan calisir login olma durumunu isLogged kontrol eder, bellegi temizler.
      successSnackbar('Başarılı Giriş.', 'Hoşgeldiniz.');
    } else {
      loginButtonLoading.value = false;
      errorSnackbar(
          'Başarısız Giriş.', 'e-mail veya şifre hatalı, tekrar deneyiniz.');
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
