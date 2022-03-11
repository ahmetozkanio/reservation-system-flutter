import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/theme_cache.dart';
import '../panachefile/amber_theme.dart';
import '../panachefile/black_theme.dart';
import '../panachefile/blue_theme.dart';
import '../panachefile/bluegray_theme.dart';
import '../panachefile/brown_theme.dart';
import '../panachefile/cyan_theme.dart';
import '../panachefile/deeporange_theme.dart';
import '../panachefile/deeppurple_theme.dart';
import '../panachefile/green_theme.dart';
import '../panachefile/grey_theme.dart';
import '../panachefile/indigo_theme.dart';
import '../panachefile/lightblue_theme.dart';
import '../panachefile/lightgreen_theme.dart';
import '../panachefile/lime_theme.dart';
import '../panachefile/orange_theme.dart';
import '../panachefile/pink_theme.dart';
import '../panachefile/purple_theme.dart';
import '../panachefile/red_theme.dart';
import '../panachefile/teal_theme.dart';
import '../panachefile/yellow_theme.dart';

class ThemesController extends GetxController with ThemeCacheManager {
  static var character = EnumThemeData.blueTheme;
  // var cacheTheme = ThemeData().obs;

  @override
  void onInit() {
    super.onInit();
    radioThemeValue();
    print(ThemeCacheManager.getTheme());
  }

  static ThemeData? getStorageInitTheme() {
    // var initTheme = ThemeCacheManager.getTheme().toString().split(".");
    var init = ThemeCacheManager.getTheme();
    //print(init.toString());
    var darkTheme = ThemeCacheManager.getDarkTheme();
    //print(darkTheme);
    if (darkTheme != null) {
      for (var index in EnumThemeData.values) {
        if (index.toString() == darkTheme) {
          return themeSelect(index);
        }
      }
    }
    if (init != null) {
      for (var index in EnumThemeData.values) {
        if (index.toString() == init) {
          return themeSelect(index);
        }
      }
    }
  }

  radioThemeValue() {
    var init = ThemeCacheManager.getTheme();
    if (init != null) {
      for (var index in EnumThemeData.values) {
        if (index.toString() == init) {
          character = index;
        }
      }
    }
  }

  static ThemeData themeSelect(EnumThemeData? enumThemeData) {
    switch (enumThemeData) {
      case EnumThemeData.darkTheme:
        return ThemeData.dark();
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
        return ThemeData.light();
    }
  }

  saveThemes(EnumThemeData? enumThemeData) async {
    await saveTheme(enumThemeData);
  }
}

enum EnumThemeData {
  darkTheme,
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
