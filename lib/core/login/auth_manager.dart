import 'package:get/get.dart';

import 'auth_cache_manager.dart';

class AuthenticationManager extends GetxController with AuthCacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(
    String token,
    String userId,
    String eMail,
    int role,
  ) async {
    isLogged.value = true;
    //Token is cached
    try {
      await saveLoginInfo(
        token,
        userId,
        eMail,
        role,
      );
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
}
