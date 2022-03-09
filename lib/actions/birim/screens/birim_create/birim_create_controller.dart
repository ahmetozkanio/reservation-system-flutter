import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_list_controller.dart';
import '../../model/birim_model.dart';
import '/actions/birim/api/birim_api.dart';
import '/actions/sehirilce/api/ilce_api.dart';
import '/actions/sehirilce/api/sehir_api.dart';
import '/actions/sehirilce/models/sehir_model.dart';

class BirimCreateController extends GetxController {
  static Birim? updateBirimIndex;

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
    sehirAdiList().clear();
    sehirList.clear();
    ilceAdi.clear();
    getSehirIlceList();

    super.onInit();
  }

  @override
  void onClose() {
    ilceList.clear();
    super.onClose();
  }

  updateBirim(Birim? birim) {
    //BirimListController birimListController = Get.find();
    try {
      if (birim != null) {
        birimAdiCtrl.text = birim.adi!;
        sehirName = birim.sehirAdi!;
        ilceName = birim.ilceAdi!;
        yetkiliAdiCtrl.text = birim.yetkiliKisi!;
        yetkiliEmailCtrl.text = birim.email!;
        yetkiliCepTelCtrl.text = birim.cepTelefon!;
        yetkiliOfisTelCtrl.text = birim.ofisTelefon!;
      }
    } finally {}
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
}
