import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';
import 'package:theme_provider/theme_provider.dart';

import 'settings/themes/core/theme_cache.dart';
import 'settings/themes/screens/themes_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(
    Home(),
  );
}
