import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/accounts/login/screens/login_view.dart';
import 'package:library_reservation_liberta_flutter/home/controller.dart';
import 'package:library_reservation_liberta_flutter/home/splash_view.dart';

import 'auth_cache_manager.dart';

class AuthenticationManager extends GetxController with AuthCacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeUserCacheInfo();
    Get.clearRouteTree();
    Get.offAll(() => SplashView());
  }

  void login(
    token,
    userId,
    eMail,
    role,
  ) async {
    //Token is cached
    try {
      await saveLoginInfo(
        token,
        eMail,
        userId,
        role,
      );
      isLogged.value = true;
    } catch (e) {
      print(e.toString());
    }
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  getUserToken() {
    return getToken();
  }
}
