import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/home_view.dart';

import '../settings/actions/themes/initial_function/themes.dart';

class HomeBaseController extends GetxController {
  @override
  void onInit() {
    // Theme Storage initial
    initialTheme();

    super.onInit();
  }
}
