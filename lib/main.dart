import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';

import 'example.dart';

Future main() async {
  await GetStorage.init();

  runApp(
    Home(),
  );
}
