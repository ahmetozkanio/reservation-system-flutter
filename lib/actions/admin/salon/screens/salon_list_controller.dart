import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../api/salon_api.dart';

class SalonListController extends GetxController {
  var isLoading = true.obs;

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

  @override
  void onInit() {
    super.onInit();
  }

  salonFetchApi() {}

  dateFormat(DateTime dateTime) {
    String formatDate;
    if (dateTime != null) {
      formatDate = DateFormat('yyyy-MM-dd').format(dateTime);
      return formatDate;
    }
  }

  timeFormat(DateTime dateTime) {
    String formatTime;
    if (dateTime != null) {
      formatTime = DateFormat('HH:mm').format(dateTime);
      return formatTime;
    }
  }
}
