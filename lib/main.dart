import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_list_view.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';
import 'package:theme_provider/theme_provider.dart';
import 'example.dart';
import 'themes/theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(),
      ),
    ),
  );
}
