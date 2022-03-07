import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenuController extends GetxController {
  var icon = Icons.wb_sunny_outlined;

  @override
  void onInit() {
    getThemeInfo();
    super.onInit();
  }

  getThemeInfo() {
    if (!Get.isDarkMode) {
      icon = Icons.dark_mode_outlined;
    }
  }
}
