import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../settings/actions/themes/screens/themes_controller.dart';

initialTheme() {
  var themeData = ThemesController.getStorageInitTheme();
  if (themeData != null) {
    Get.changeTheme(themeData);
    return themeData;
  } else {
    Get.changeTheme(ThemeData.light());
  }
}
