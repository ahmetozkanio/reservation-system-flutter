import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/panaches/blue_theme.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/screens/themes_controller.dart';

mixin ThemeCacheManager {
  static final GetStorage themeBox = GetStorage();
  Future<bool> saveTheme(EnumThemeData? themeData) async {
    ThemeData defaultTheme = blueTheme;
    await themeBox.write("theme", themeData.toString());
    return true;
  }

  // static String? getTheme() {
  //   var themeData = themeBox.read("theme").toString().split(".");
  // }
  //   return themeData;
  // }

  // Future<void> removeToken() async {
  //   await box.remove(CacheManagerKey.TOKEN.toString());
  // }
}
