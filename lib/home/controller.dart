import 'package:get/get.dart';

import '../settings/actions/themes/initial_function/themes.dart';

class HomeBaseController extends GetxController {
  @override
  void onInit() {
    // Theme Storage initial
    initialTheme();
    super.onInit();
  }
}
