import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationViewController extends GetxController {
  var selectedIndexColor = Colors.green.obs;
  var disabledIndexColor = Colors.red;
  var emptyIndexColor = Colors.grey[200];

  var selectedIndex = 0.obs;

  var isChecked = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
