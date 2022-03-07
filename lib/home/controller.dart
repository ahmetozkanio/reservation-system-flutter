import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/core/theme_cache.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/initial_function/themes.dart';

import '../settings/themes/screens/themes_controller.dart';

class HomeBaseController extends GetxController {
  @override
  void onInit() {
    // Theme Storage initial

    initialTheme();
    super.onInit();
  }
}
