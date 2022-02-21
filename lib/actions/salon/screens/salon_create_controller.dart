import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/model/birim_model.dart';

import '../../birim/api/birim_api.dart';

class SalonCreateController extends GetxController {
  var currentStep = 0.obs;
  var birimList = <Birim>[].obs;
  static var birimListAdi = <String>[].obs;

  //final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController birimCtrl = TextEditingController();
  TextEditingController salonAdiCtrl = TextEditingController();
  TextEditingController sandalyeCtrl = TextEditingController();
  TextEditingController blokCtrl = TextEditingController();

  @override
  void onInit() {
    getBirimList();
    super.onInit();
  }

  @override
  void onClose() {
    birimListAdi.clear();
    birimList.clear();
    super.onClose();
  }

  String? validatePassword(
    String value,
  ) {
    if (value.length < 8) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  String? validateCustom(String value, Function function) {
    return function(value);
  }

  getBirimList() async {
    try {
      var birims = await BirimApi.getBirimListApi();
      if (birims != null) {
        birimList.assignAll(birims);
        birimAdi();
      }
    } finally {}
  }

  List<String?> birimAdi() {
    for (var list in birimList) {
      if (list.adi != null) {
        birimListAdi.add(list.adi!);
      }
    }
    return birimListAdi;
  }

  // var email = '';
  // var password = '';

  // @override
  // void onInit() {
  //   super.onInit();
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  // String? validateEmail(String value) {
  //   if (!GetUtils.isEmail(value)) {
  //     return "Provide valid Email";
  //   }
  //   return null;
  // }

  // String? validatePassword(String value) {
  //   if (value.length < 6) {
  //     return "Password must be of 6 characters";
  //   }
  //   return null;
  // }

  // void checkLogin() {
  //   final isValid = loginFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   loginFormKey.currentState!.save();
  //   print(emailController.text);
  //   print(passwordController.text);
  // }
}
