import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/actions/birim/api/birim_api.dart';
import '/actions/sehirilce/api/ilce_api.dart';
import '/actions/sehirilce/api/sehir_api.dart';
import '/actions/sehirilce/models/sehir_model.dart';

class BirimCreateController extends GetxController {
  var isLoading = true.obs;

  var currentStep = 0.obs;

  static var birimCreated;

  final GlobalKey<FormState> birimFormKey = GlobalKey<FormState>().obs();
  final GlobalKey<FormState> yetkiliFormKey = GlobalKey<FormState>().obs();

  TextEditingController birimAdiCtrl = TextEditingController();
  bool aktifMi = true;
  String sehirName = "".obs();
  String ilceName = "".obs();

  TextEditingController yetkiliAdiCtrl = TextEditingController();
  TextEditingController yetkiliEmailCtrl = TextEditingController();
  TextEditingController yetkiliCepTelCtrl = TextEditingController();
  TextEditingController yetkiliOfisTelCtrl = TextEditingController();

  int? sehirId;
  int? ilceId;

  var sehirList = <Sehir>[].obs;
  var ilceList = [].obs;
  static var sehirAdi = <String>[].obs;
  static var ilceAdi = <String>[].obs;

  @override
  void onInit() {
    getSehirIlceList();

    super.onInit();
  }

  @override
  void onClose() {
    ilceList.clear();
    super.onClose();
  }

  Future<bool> postBirim() async {
    try {
      isLoading(true);

      var birimPost = await BirimApi.postBirimCreate(
          aktifMi,
          birimAdiCtrl.text,
          sehirId,
          ilceId,
          yetkiliAdiCtrl.text,
          yetkiliEmailCtrl.text,
          yetkiliCepTelCtrl.text,
          yetkiliOfisTelCtrl.text);

      if (birimPost != null && birimPost == true) {
        birimCreated = true;

        return true;
      } else {
        return false;
      }
    } finally {
      //  birimCreated = true;
      isLoading(false);
    }
  }

  getSehirIlceList() async {
    try {
      isLoading(true);
      var sehir = await SehirApi.getSehirListApi();

      if (sehir != null) {
        sehirList.assignAll(sehir);
        print("Sehirler : " + sehir[0].adi.toString());
        sehirAdiList();
        isLoading(false);
      }
    } finally {
      //isLoading(false);
    }
  }

  getIlceList() async {
    try {
      isLoading(true);
      ilceAdi.clear();

      if (postSehirId() != null) {
        var ilce = await IlceApi.getIlceListApi(postSehirId()!);
        if (ilce != null) {
          ilceList.assignAll(ilce);
          print("Ilceler : " + ilce[0].adi.toString());
          ilceAdiList();
        }
      }
    } finally {
      isLoading(false);
    }
  }

  List<String?> sehirAdiList() {
    for (var list in sehirList) {
      if (list.adi != null) {
        sehirAdi.add(list.adi!);
      }
    }
    return sehirAdi;
  }

  List<String?> ilceAdiList() {
    for (var list in ilceList) {
      if (list.adi != null) {
        ilceAdi.add(list.adi!);
      }
    }
    return ilceAdi;
  }

  int? postSehirId() {
    for (var list in sehirList) {
      if (list.adi == sehirName) sehirId = list.id;
    }
    return sehirId;
  }

  int? postIlceId() {
    print("postIlceId cagirildi");
    for (var list in ilceList) {
      if (list.adi == ilceName) ilceId = list.id;
    }
    print("ilce id ${ilceId}");
    return ilceId;
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
