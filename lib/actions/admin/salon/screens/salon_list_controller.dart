import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/birim/api/birim_api.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/birim/model/birim_model.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/model/salon_ozellikleri_model.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../api/salon_api.dart';

class SalonListController extends GetxController {
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchBirimList(); //Birimleri baslangicta servisten cagirir.
    super.onInit();
  }

  //Birim Listesi
  List<BirimModel>? birimList; //BirimModel Listemiz.
  final List<String> birimNameList =
      []; //BirimModel.birimAdi String birim adi listemiz dropdown icin gerekli.
  String? seciliBirimName; //Dropdown dan secili olan birimAdi miz.
  RxBool birimListLoading =
      true.obs; //Birim listesi servisten bekleme suresi icin kontrol.

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

  //Salon Ozellikleri
  var salonOzellikleriList = ['Wifi', 'Priz'];

  //Tarih icin formatlama
  dateFormat(DateTime dateTime) {
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
  static List<SalonOzellikleriModel?> salonOzellikList = [
    SalonOzellikleriModel(id: 1, adi: "Wifi"),
    SalonOzellikleriModel(id: 2, adi: "Priz"),
  ];
  final salonOzellikleriItems = salonOzellikList
      .map((salonOzellik) => MultiSelectItem<SalonOzellikleriModel?>(
          salonOzellik, salonOzellik!.adi))
      .toList()
      .obs;
  List seciliOzellikler = [].obs; //Secilmis salon ozellikleri listesi
  // ------------------------------------------------------------------

  //Api Service *******************************************************
  fetchBirimList() async {
    //Baslangica cagirilir ve birimler listenip ekrana yazdirilir.
    try {
      birimList =
          await BirimApi().getBirimListApi(); //BirimListesi olusturulur.

      if (birimList != null) {
        for (var list in birimList!) {
          //Birim Listemizdeki birimAdlarini String bir liste haline getiriyoruz.
          if (list.birimAdi != null) {
            birimNameList.add(list.birimAdi!);
          }
        }
      }
    } finally {
      birimListLoading.value =
          false; //Birimler yuklendigi zaman shimmer icin false durumu.
    }
  }
}
