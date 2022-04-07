import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/core/login/auth_cache_manager.dart';

class DrawerMenuController extends GetxController with AuthCacheManager {
  var icon = Icons.wb_sunny_outlined;
  var userEmail = "".obs;
  @override
  void onInit() {
    getThemeInfo();
    getUserCacheInfo();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getThemeInfo() {
    if (!Get.isDarkMode) {
      icon = Icons.dark_mode_outlined;
    }
  }

  getUserCacheInfo() {
    userEmail.value = getEmail() ?? "";
  }
}
