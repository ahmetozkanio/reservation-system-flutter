import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController successSnackbar(String title, String subtitle) {
  return Get.snackbar(
    title,
    subtitle,
    icon: Icon(Icons.done, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Color.fromARGB(255, 50, 139, 53),
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 10),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

SnackbarController errorSnackbar(String title, String subtitle) {
  return Get.snackbar(
    title,
    subtitle,
    icon: Icon(Icons.close, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Color.fromARGB(255, 206, 8, 8),
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 10),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
