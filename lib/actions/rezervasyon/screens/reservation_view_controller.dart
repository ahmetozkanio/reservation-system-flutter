import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReservationViewController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      //code will run when widget rendering complete
    });
  }
}
