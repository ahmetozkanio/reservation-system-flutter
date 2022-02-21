import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/sehirilce/api/sehirilce_api.dart';
import 'package:library_reservation_liberta_flutter/actions/sehirilce/models/sehirilce_model.dart';

import '../model/birim_model.dart';
import 'birim_create_view.dart';

class BirimCreateController extends GetxController {
  var currentStep = 0.obs;

  //final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController birimAdiCtrl = TextEditingController();
  TextEditingController sehirIdCtrl = TextEditingController();
  TextEditingController ilceIdCtrl = TextEditingController();

  TextEditingController yetkiliAdiCtrl = TextEditingController();
  TextEditingController yetkiliEmailCtrl = TextEditingController();
  TextEditingController yetkiliCepTelCtrl = TextEditingController();
  TextEditingController yetkiliOfisTelCtrl = TextEditingController();

  var sehirIlceList = [].obs;
  static var sehirAdi = <String>[].obs;

  @override
  void onInit() {
    getSehirIlceList();
    super.onInit();
  }

  @override
  void onClose() {
    sehirAdi.clear();
    super.onClose();
  }

  getSehirIlceList() async {
    try {
      var sehirIlce = await SehirIlceApi.getSehirIlceListApi();

      if (sehirIlce != null) {
        sehirIlceList.assignAll(sehirIlce);
        print(sehirIlce[0].adi);
        sehirAdiList();
      }
    } finally {}
  }

  List<String?> sehirAdiList() {
    for (var list in sehirIlceList) {
      if (list.adi != null) {
        sehirAdi.add(list.adi!);
      }
    }
    return sehirAdi;
  }

  // String? validatePassword(
  //   String value,
  // ) {
  //   if (value.length < 8) {
  //     return "Password must be of 6 characters";
  //   }
  //   return null;
  // }

  // String? validateCustom(String value, Function function) {
  //   return function(value);
  // }

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
