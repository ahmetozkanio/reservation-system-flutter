import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_reservation_liberta_flutter/settings/themes/core/themes/theme_cache.dart';

import '../settings/themes/screens/themes_controller.dart';

class HomeBaseController extends GetxController {
  @override
  void onInit() {
    //Storage initial
    if (ThemesController.getStorageInitTheme() != null) {
      Get.changeTheme(ThemesController.getStorageInitTheme()!);
    }
    super.onInit();
  }
}
