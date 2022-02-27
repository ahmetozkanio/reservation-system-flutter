import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/model/birim_model.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../birim/api/birim_api.dart';
import '../../model/salon_yetki_model.dart';

class SalonCreateController extends GetxController {
  var currentStep = 0.obs;
  var birimList = <Birim>[].obs;
  static var birimListAdi = <String>[].obs;
  static var salonBlokList = [].obs;

  //final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> yetkiFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormState> salonBilgileriFormKey = GlobalKey<FormState>();

  TextEditingController birimCtrl = TextEditingController();
  TextEditingController salonAdiCtrl = TextEditingController();
  TextEditingController blokCtrl = TextEditingController();

  TextEditingController sandalyeCtrl = TextEditingController();
  //select box yetki
  // var selectYetki = [].obs;
  // var yetkiList = ["Öğrenci", "Akademisyen", "Misafir"].obs;

  static List<SalonYetki?> salonYetki = [
    SalonYetki(id: 1, name: "Öğrenci"),
    SalonYetki(id: 2, name: "Akademisyen"),
    SalonYetki(id: 3, name: "Misafir"),
  ];
  final yetkiItems = salonYetki
      .map((yetki) => MultiSelectItem<SalonYetki?>(yetki, yetki!.name))
      .toList()
      .obs;

  List selectYetki = [].obs;

  @override
  void onInit() {
    getBirimList();
    super.onInit();
  }

  @override
  void onClose() {
    birimListAdi.clear();
    birimList.clear();
    salonBlokList.clear();
    super.onClose();
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

  List<String>? salonBlokAdi() {
    String a = "Ahmet Ozkan A";
    String blokName = "";

    List<String> blokNameList = salonAdiCtrl.text.trim().split(" ");
    List<String> blokNameNumberList = [];
    try {
      if (blokNameList != null)
        for (var list in blokNameList) {
          blokName += list[0].toUpperCase();
        }
      if (blokCtrl.text != null) {
        for (int i = 0; i < int.parse(blokCtrl.text); i++) {
          blokName += i.toString();
          blokNameNumberList.add(blokName);
          if (i < 10) {
            blokName = blokName.substring(0, blokName.length - 1);
          } else if (i >= 10 && i < 100) {
            blokName = blokName.substring(0, blokName.length - 2);
          }
          if (i >= 100 && i < 1000) {
            blokName = blokName.substring(0, blokName.length - 3);
          }

          print(blokNameNumberList[i]);
        }
      }
      return blokNameNumberList;
    } catch (e) {
      print(e);
    }
  }

  // String? validatePassword(
  //   String value,
  // ) {
  //   if (value.length < 8) {
  //     return "Password must be of 6 characters";
  //   }
  //   return null;
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
