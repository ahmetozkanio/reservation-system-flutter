import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/controller.dart';
import 'package:library_reservation_liberta_flutter/settings/actions/themes/panachefile/dark_theme.dart';

import '../screens/themes_controller.dart';

initialTheme() {
  var themeData = ThemesController.getStorageInitTheme();

  if (themeData != null) {
    Get.changeTheme(themeData);
    //Home sliderApp Bar Theme

  } else {
    Get.changeTheme(ThemeData.light());
  }
}
