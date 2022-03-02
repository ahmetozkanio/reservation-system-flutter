import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/utils/drawer_menu_controller.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/panache/amber_theme.dart';

import '../core/themes/theme_cache.dart';
import '../panache/black_theme.dart';
import '../panache/blue_theme.dart';
import '../panache/bluegray_theme.dart';
import '../panache/brown_theme.dart';
import '../panache/cyan_theme.dart';
import '../panache/deeporange_theme.dart';
import '../panache/deeppurple_theme.dart';
import '../panache/green_theme.dart';
import '../panache/grey_theme.dart';
import '../panache/indigo_theme.dart';
import '../panache/lightblue_theme.dart';
import '../panache/lightgreen_theme.dart';
import '../panache/lime_theme.dart';
import '../panache/orange_theme.dart';
import '../panache/pink_theme.dart';
import '../panache/purple_theme.dart';
import '../panache/red_theme.dart';
import '../panache/teal_theme.dart';
import '../panache/yellow_theme.dart';

class ThemesController extends GetxController with ThemeCacheManager {
  static var character = EnumThemeData.amberTheme;
  var cacheTheme = ThemeData().obs;
  // themeChange() {
  //   saveTheme(character.toString());
  // }
  // static Future<bool> saveThemes(ThemeData themeData) {
  //   return saveTheme(amberTheme);
  // }

  static ThemeData themeSelect(EnumThemeData? enumThemeData) {
    switch (enumThemeData) {
      case EnumThemeData.redTheme:
        return redTheme;
      case EnumThemeData.pinkTheme:
        return pinkTheme;
      case EnumThemeData.purpleTheme:
        return purpleTheme;
      case EnumThemeData.deepPurpleTheme:
        return deepPurpleTheme;
      case EnumThemeData.indigoTheme:
        return indigoTheme;
      case EnumThemeData.blueTheme:
        return blueTheme;
      case EnumThemeData.lightBlueTheme:
        return lightBlueTheme;
      case EnumThemeData.cyanTheme:
        return cyanTheme;
      case EnumThemeData.tealTheme:
        return tealTheme;
      case EnumThemeData.greenTheme:
        return greenTheme;
      case EnumThemeData.lightGreenTheme:
        return lightGreenTheme;
      case EnumThemeData.limeTheme:
        return limeTheme;
      case EnumThemeData.yellowTheme:
        return yellowTheme;
      case EnumThemeData.amberTheme:
        return amberTheme;
      case EnumThemeData.orangeTheme:
        return orangeTheme;
      case EnumThemeData.deepOrangeTheme:
        return deepOrangeTheme;
      case EnumThemeData.brownTheme:
        return brownTheme;
      case EnumThemeData.blueGrayTheme:
        return blueGrayTheme;
      case EnumThemeData.blackTheme:
        return blackTheme;
      case EnumThemeData.greyTheme:
        return greyTheme;
      default:
        return amberTheme;
    }
  }

  final isLogged = false.obs;

  saveThemes(EnumThemeData? enumThemeData) async {
    await saveTheme(enumThemeData);
  }

  // static String? checkTheme() {
  //   final theme = getTheme();
  //   if (theme != null) {
  //     print(theme);
  //     return theme;
  //   }
  //   return null;
  // }
}

// static EnumThemeData? getThemes() {
//   var theme = getTheme();
//   return theme;
// }

enum EnumThemeData {
  amberTheme,
  blackTheme,
  blueTheme,
  blueGrayTheme,
  brownTheme,
  cyanTheme,
  deepOrangeTheme,
  deepPurpleTheme,
  greenTheme,
  greyTheme,
  orangeTheme,
  indigoTheme,
  lightBlueTheme,
  lightGreenTheme,
  limeTheme,
  pinkTheme,
  purpleTheme,
  redTheme,
  tealTheme,
  yellowTheme
}
