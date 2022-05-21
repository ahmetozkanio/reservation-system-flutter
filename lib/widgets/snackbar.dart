import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

SnackbarController successSnackbar(String title, String subtitle) {
  return Get.snackbar(
    title,
    subtitle,
    icon: Icon(Icons.done, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Color.fromARGB(255, 50, 139, 53),
    borderRadius: 20,
    margin: const EdgeInsets.all(8.0),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

SnackbarController greySnackbar(String title, String subtitle) {
  return Get.snackbar(
    title,
    subtitle,
    // icon: Icon(Icons.done, color: Color.fromARGB(255, 155, 154, 154)),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Color.fromARGB(255, 207, 207, 207),

    borderRadius: 20,
    // margin: EdgeInsets.all(15),
    colorText: Color.fromARGB(255, 71, 71, 71),
    duration: Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

SnackbarController errorSnackbar(String title, String subtitle) {
  return Get.snackbar(
    title,
    subtitle,
    icon: Icon(Icons.close, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Color.fromARGB(255, 202, 27, 27),
    borderRadius: 20,
    margin: EdgeInsets.all(8.0),
    colorText: Colors.white,
    duration: Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

SnackbarController infoSnackbar(String title, String subtitle) {
  return Get.snackbar(
    title,
    subtitle,
    colorText: Color.fromARGB(255, 0, 0, 0),
    icon: Icon(Icons.search_off_rounded, color: Color.fromARGB(255, 0, 0, 0)),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.amber,
    borderRadius: 20,
    margin: EdgeInsets.all(8.0),
    duration: Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
