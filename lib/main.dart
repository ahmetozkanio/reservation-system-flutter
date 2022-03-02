import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';

import 'settings/themes/core/themes/theme_cache.dart';
import 'settings/themes/screens/themes_controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
      // theme: ThemesController.themeSelect(
      //   ThemeCacheManager.themeBox.read("theme"),)
    ),
  );
}
