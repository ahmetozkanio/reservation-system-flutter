import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/birim_api.dart';
import '../../model/birim_model.dart';

class BirimCreateController extends GetxController {
  static BirimModel? updateBirimIndex; // Update- create  belirleme

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

  // var sehirList = <Sehir>[].obs;
  var ilceList = [].obs;
  static var sehirAdi = <String>[].obs;
  static var ilceAdi = <String>[].obs;

  @override
  void onInit() {
    //sehirAdiList().clear();
    // sehirList.clear();
    //  ilceAdi.clear();
    if (updateBirimIndex == null) {
      // getSehirIlceList();
    }
    super.onInit();
  }

  @override
  void onClose() {
    ilceList.clear();
    super.onClose();
  }

  // updateBirimInitial(BirimModel? birim) {
  //   //BirimListController birimListController = Get.find();
  //   try {
  //     if (birim != null) {
  //       birimAdiCtrl.text = birim.adi!;
  //       sehirName = birim.sehirAdi!;
  //       ilceName = birim.ilceAdi!;
  //       yetkiliAdiCtrl.text = birim.yetkiliKisi!;
  //       yetkiliEmailCtrl.text = birim.email!;
  //       yetkiliCepTelCtrl.text = birim.cepTelefon!;
  //       yetkiliOfisTelCtrl.text = birim.ofisTelefon!;
  //       // getSehirIlceList();
  //       // getIlceList();
  //     }
  //   } finally {}
  // }

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
        return true;
      } else {
        return false;
      }
    } finally {
      //  birimCreated = true;
      isLoading(false);
    }
  }

  // Future<bool> updateBirim() async {
  //   try {
  //     isLoading(true);

  //     var birimUpdate = await BirimApi.putUpdateBirim(
  //         updateBirimIndex?.id,
  //         aktifMi,
  //         birimAdiCtrl.text,
  //         sehirId,
  //         ilceId,
  //         yetkiliAdiCtrl.text,
  //         yetkiliEmailCtrl.text,
  //         yetkiliCepTelCtrl.text,
  //         yetkiliOfisTelCtrl.text);

  //     if (birimUpdate != null && birimUpdate == true) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // getSehirIlceList() async {
  //   try {
  //     isLoading(true);
  //     var sehir = await SehirApi.getSehirList();

  //     if (sehir != null) {
  //       sehirList.assignAll(sehir);
  //       print("Sehirler : " + sehir[0].adi.toString());
  //       sehirAdiList();
  //       isLoading(false);

  //       if (updateBirimIndex != null) {
  //         getIlceList();
  //       }
  //     }
  //   } finally {
  //     //isLoading(false);
  //   }
  // }

  // getIlceList() async {
  //   try {
  //     isLoading(true);
  //     ilceAdi.clear();

  //     if (postSehirId() != null) {
  //       var ilce = await IlceApi.getIlceListApi(postSehirId()!);
  //       if (ilce != null) {
  //         ilceList.assignAll(ilce);
  //         print("Ilceler : " + ilce[0].adi.toString());
  //         ilceAdiList();
  //       }
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // List<String?> sehirAdiList() {
  //   for (var list in sehirList) {
  //     if (list.adi != null) {
  //       sehirAdi.add(list.adi!);
  //     }
  //   }
  //   return sehirAdi;
  // }

  // List<String?> ilceAdiList() {
  //   for (var list in ilceList) {
  //     if (list.adi != null) {
  //       ilceAdi.add(list.adi!);
  //     }
  //   }
  //   return ilceAdi;
  // }

  // int? postSehirId() {
  //   for (var list in sehirList) {
  //     if (list.adi == sehirName) sehirId = list.id;
  //   }
  //   return sehirId;
  // }

  // int? postIlceId() {
  //   print("postIlceId cagirildi");
  //   for (var list in ilceList) {
  //     if (list.adi == ilceName) ilceId = list.id;
  //   }
  //   print("ilce id $ilceId");
  //   return ilceId;
  // }
}
