import 'package:get/get.dart';

import 'package:library_reservation_liberta_flutter/actions/admin/birim/api/birim_api.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/birim/model/birim_model.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/model/salon_ozellikleri_model.dart';
import 'package:library_reservation_liberta_flutter/widgets/snackbar.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../api/salon_api.dart';
import '../model/salon_model.dart';

class SalonListController extends GetxController {
  //Loading shimmer controls
  RxBool birimListLoading = true
      .obs; //Birim listesi servisten bekleme suresi icin kontrol. Baslangicta calisir.
  RxBool salonOzellikleriLoading = true
      .obs; //SalonOzellikleri listesi servisten bekleme suresi icin kontrol. Baslangicta calisir.

  RxBool salonAramaLoading = true.obs; //Salon arama yapildiginda isleve gecer.
  RxBool salonListLoading = true
      .obs; //Salon aranirken shimmeri devreye sokmak icin. SalonAramaLoading false yapilir.

  @override
  void onInit() {
    fetchBirimList(); //Birimleri baslangicta servisten cagirir.
    fetchSalonOzellikleri(); //Salon Ozelliklerini baslangicta servisten cagirilir.
    fetchSalonList();//Salonlar Uygulama Acildiginda Listelenir Filtreleme yapilmadadan default degerler gonderilerek.
    super.onInit();
  }

  //Birimler ************************************************** Start
  //Birim Listesi
  List<BirimModel>? birimList; //BirimModel Listemiz. Api
  List<MultiSelectItem<dynamic>> birimMultiSelectList =
      []; // Multi select te gosterilen listemiz
  List? seciliBirimler; //Kullanicinin sectigi birimlerin listesi.
  String secilmisBirimlerinAdlari =
      ''; //  Api ye gonderilecek birlestirilmis birim adlari

  secilmisBirimlerinAdlariBirlestirilmesi() {
    //seciliBirimler Listesindeki birimAdi lari  virgul ile birlestirip Tek Bir String Haline Getirilir
    secilmisBirimlerinAdlari = '';
    if (seciliBirimler != null) {
      for (var list in seciliBirimler!) {
        secilmisBirimlerinAdlari = secilmisBirimlerinAdlari.toString() +
            list.birimAdi.toString() +
            ',';
      }
    }
  }
  // ------------------------------------------------------------------ End

  //TARIH VE SAAT ALANI ************************************************** Start
  //Tarih
  RxString salonBaslangicTarihi = ''.obs;
  RxString salonBitisTarihi = ''.obs;
  //Saat
  RxString salonBaslangicSaati = ''.obs;
  RxString salonBitisSaati = ''.obs;

  //Formatlama
  Rx<DateTime> salonMinBitisTarihiAndBaslangicCurrentDate = DateTime.now()
      .obs; // Ayarlanan tarih hem secili olmasi icin hem bitis tarihinin secebilecegi min tarih icin gerekli.
  Rx<DateTime> salonBitisTarihiCurrentDate = DateTime.now()
      .obs; //Ayarlanan tarih current time ile secili olmasi icin gerekli.
  Rx<DateTime> salonMinBitisSaatiAndBaslangicCurrentTime = DateTime.now()
      .obs; //Ayarlanan saat icin secilen saat degerinin tekrar gozukmesi ve bitis saat degerinin baslangic degerinin atanmasi icin gerekli.
  Rx<DateTime> salonBitisSaatCurrentTime = DateTime.now()
      .obs; //Ayarlanan saat current time ile secili olmasi icin gerekli.

  //SalonListeleme
  List<SalonModel> salonList =
      <SalonModel>[].obs; // Api den gelen salonListemiz.

  // ------------------------------------------------------------------ End

  //Salon Ozellikleri Alani ***************************************** Start
  List<SalonOzellikleriModel>? salonOzellikleriList =
      []; //Salon Ozellikleri Listesi Api den gelen
  List<MultiSelectItem<dynamic>> salonOzellikleriMultiSelectList =
      []; // MultiSelect icin listemiz
  List?
      secilmisSalonOzellikleri; //Kullanicinin sectigi salon ozellikleri listesi.
  String secilmisSalonOzellikAdlari =
      ''; //Api ye gonderilecek birlestirilmis salon Ozellik adlari

  secilmisSalonOzellikAdlariBirlestirilmesi() {
    //Secili SalonOzellikleri Listesindeki birimAdi lari  virgul ile birlestirip Tek Bir String Haline Getirilir
    secilmisSalonOzellikAdlari = '';
    if (secilmisSalonOzellikleri != null) {
      for (var list in secilmisSalonOzellikleri!) {
        secilmisSalonOzellikAdlari = secilmisSalonOzellikAdlari.toString() +
            list.salonOzellikAdi.toString() +
            ',';
      }
    }
  }
  // ------------------------------------------------------------------ End

  //Api Service ******************************************************* Api start
  fetchBirimList() async {
    //Baslangicta cagirilir ve birimler listenip ekrana yazdirilir.
    try {
      birimList =
          await BirimApi().getBirimListApi(); //BirimListesi olusturulur.
      if (birimList != null) {
        //Birim Listemizi multiSelectList icin birim adi gorunumunde bir liste elde ediyoruz.
        birimMultiSelectList = birimList!
            .map((birim) =>
                MultiSelectItem<BirimModel?>(birim, birim.birimAdi ?? ''))
            .toList();
      } else {
        birimMultiSelectList = [];
      }
    } finally {
      birimListLoading.value =
          false; //Birimler yuklendigi zaman shimmer icin false durumu.
    }
  }

  fetchSalonOzellikleri() async {
    //Baslangicta cagirilir ve salonOzellikleri listenip ekrana yazdirilir.
    try {
      salonOzellikleriList = await SalonApi()
          .salonOzellikleriListApi(); //SalonOzellikleriListesi olusturulur.

      if (salonOzellikleriList != null) {
        //SalonOzellikleri Listemizdeki ozellikAdi ni liste haline getiriyoruz.
        salonOzellikleriMultiSelectList = salonOzellikleriList!
            .map((salonOzellik) => MultiSelectItem<SalonOzellikleriModel?>(
                salonOzellik, salonOzellik.salonOzellikAdi ?? ''))
            .toList();
      } else {
        salonOzellikleriMultiSelectList = [];
      }
    } finally {
      salonOzellikleriLoading.value =
          false; //SalonOzellikleri yuklendigi zaman shimmer icin false durumu.
    }
  }

  fetchSalonList() async {
    //Salon listemiz Salon ara butonuyla tetiklenir ve degerlerimiz apiye gonderilir.
    salonAramaLoading.value = false; //Arama butonu kontrolu.
    salonListLoading.value = true; // Shimmer devreye girer.

    try {
      var _list = await SalonApi().salonListApi(
        salonBaslangicTarihi.value,
        salonBitisTarihi.value,
        salonBaslangicSaati.value,
        salonBitisSaati.value,
        secilmisSalonOzellikAdlari,
        secilmisBirimlerinAdlari,
      );

      if (_list != null) {
        salonList = _list;
        salonListLoading.value = false;
      } else {
        salonList.clear();
        salonAramaLoading.value = true;
        infoSnackbar("Salon Bulunamadı!",
            'Arama yaptığınız bilgilerde herhangi bir sonuç bulunamadı. ');
      }
      // } else {
      //   errorSnackbar("Eksik Bilgi!",
      //       'Birimler, tarih ve saat  ve salon özellikleri alanlarını boş bırakmayınız. ');
      //   salonAramaLoading.value = true;
      // }
    } catch (e) {
      print("SalonListeme " + e.toString());
    }
  }
  // ------------------------------------------------------------------Api end

}
