import 'package:flutter/material.dart';
import 'package:library_reservation_liberta_flutter/themes/panache/amber_theme.dart';

class ThemeModel {
  ThemeModel({
    this.id,
    this.themeData,
  });

  int? id;
  ThemeData? themeData;
}

List<ThemeModel> themeList = [
  ThemeModel(
    id: 1,
    themeData: amberTheme,
  ),
];
