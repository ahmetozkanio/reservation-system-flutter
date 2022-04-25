import 'package:get/get_state_manager/get_state_manager.dart';

import 'themes.dart';

class InitializersManager extends GetxController {
  @override
  void onInit() {
    // Theme Storage initial
    initialTheme();
    super.onInit();
  }
}
