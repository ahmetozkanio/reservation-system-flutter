import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    super.onInit();
  }

  //Birim Listesi
  List<BirimModel>? birimList; //BirimModel Listemiz. Api
  List birimMultiSelectList = []; //
  String? seciliBirimName; //Dropdown dan secili olan birimAdi miz.

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

  //Tarih icin formatlama
  dateFormat(dateTime) {
    String formatDate;

    if (dateTime != null) {
      formatDate = DateFormat('yyyy-MM-dd').format(dateTime);
      return formatDate;
    }
  }

  //Saat icin Formatlama
  timeFormat(DateTime dateTime) {
    String formatTime;
    if (dateTime != null) {
      formatTime = DateFormat('HH:mm').format(dateTime);
      return formatTime;
    }
  }

  //Salon Ozellikleri Alani *****************************************

  List<SalonOzellikleriModel>? salonOzellikleriList =
      []; //Salon Ozellikleri Listesi
  List<MultiSelectItem<SalonOzellikleriModel?>> salonOzellikleriItems = [];

  List seciliOzellikler = []; //Secilmis salon ozellikleri listesi
  String salonOzellikleriBirlesimi = '';
  // salonOzellikSplit() {
  //   salonOzellikleriBirlesimi = '';
  //   for (var list in seciliOzellikler) {
  //     salonOzellikleriBirlesimi =
  //         salonOzellikleriBirlesimi.toString() + list.adi.toString();
  //   }
  // }
  // ------------------------------------------------------------------

  //Api Service ******************************************************* Api start
  fetchBirimList() async {
    //Baslangicta cagirilir ve birimler listenip ekrana yazdirilir.
    try {
      birimList =
          await BirimApi().getBirimListApi(); //BirimListesi olusturulur.

      if (birimList != null) {
        //Birim Listemizdeki birimAdlarini String bir liste haline getiriyoruz.

        // birimNameList.add(list.birimAdi!);

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
        // var list = salonOzellikleriList!
        //     .map((salonOzellik) => MultiSelectItem<SalonOzellikleriModel?>(
        //         salonOzellik, salonOzellik.salonOzellikAdi ?? ''))
        //     .toList();
        // salonOzellikleriItems = list;
      }
    } finally {
      salonOzellikleriLoading.value =
          false; //SalonOzellikleri yuklendigi zaman shimmer icin false durumu.
    }
  }

  fetchSalonList() async {
    //Salon listemiz Salon ara butonuyla tetiklenir ve degerlerimiz apiye gonderilir.
    salonAramaLoading.value = false; //Arama butonu kontrolu.
    salonListLoading.value = true;

    try {
      if (salonBaslangicTarihi.value != '' &&
          salonBitisTarihi.value != '' &&
          salonBaslangicSaati.value != '' &&
          salonBitisSaati.value != '' &&
          salonOzellikleriBirlesimi != '' &&
          seciliBirimName != null) {
        var _list = await SalonApi().salonListApi(
            salonBaslangicTarihi.value,
            salonBitisTarihi.value,
            salonBaslangicSaati.value,
            salonBitisSaati.value,
            salonOzellikleriBirlesimi,
            seciliBirimName!);

        if (_list != null) {
          salonList = _list;
          salonListLoading.value = false;
        } else {
          salonList.clear();
          salonAramaLoading.value = true;
          infoSnackbar("Salon Bulunamadı!",
              'Arama yaptığınız bilgilerde herhangi bir sonuç bulunamadı. ');
        }
      } else {
        errorSnackbar("Eksik Bilgi!",
            'Birimler, tarih ve saat  ve salon özellikleri alanlarını boş bırakmayınız. ');
        salonAramaLoading.value = true;
      }
    } catch (e) {
      print("SalonListeme " + e.toString());
    }
  }
  // ------------------------------------------------------------------Api end

}
