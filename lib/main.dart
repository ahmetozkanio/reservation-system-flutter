import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';
import 'package:library_reservation_liberta_flutter/themes/panache/indigo_theme.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:library_reservation_liberta_flutter/themes/panache/purple_theme.dart';

import 'example.dart';

void main() {
  runApp(
    GetMaterialApp(home: Home(), theme: purpleTheme),
  );
}
