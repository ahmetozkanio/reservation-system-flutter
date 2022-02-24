import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_list_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BirimListController>(BirimListController());
  }
}
