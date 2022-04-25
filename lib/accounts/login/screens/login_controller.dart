import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_reservation_liberta_flutter/accounts/login/api/login_api.dart';
import 'package:library_reservation_liberta_flutter/home/splash_view.dart';
import 'package:library_reservation_liberta_flutter/widgets/snackbar.dart';
import "package:path_provider/path_provider.dart";
import '../../../core/login/auth_manager.dart';
import '../model/login_request_model.dart';

class LoginController extends GetxController {
  final LoginService _loginService = Get.put(LoginService());
  late final AuthenticationManager _authManager = Get.find();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController sifreCtrl = TextEditingController();

  var loadingCircle = false.obs;
  var pageInitialLoadingCircle = true.obs;

  @override
  void onInit() {
    Future _deleteCacheDir() async {
      final cacheDir = await getTemporaryDirectory();

      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
      }
      super.onInit();
    }
  }

  Future<void> loginUser(String email, String sifre) async {
    loadingCircle.value = true;
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, sifre: sifre));

    if (response != null) {
      /// Set isLogin to true

      _authManager.login(
        response.token,
        response.userId,
        response.email,
        response.role,
      );
      loadingCircle.value = false;
      Get.offAll(() => SplashView());
      successSnackbar('Başarılı Giriş.', 'Hoşgeldiniz.');
    } else {
      loadingCircle.value = false;
      errorSnackbar(
          'Başarısız Giriş.', 'e-mail veya şifre hatalı, tekrar denenyiniz.');
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
