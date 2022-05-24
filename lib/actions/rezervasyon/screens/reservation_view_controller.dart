import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/model/salon_model.dart';
import 'package:library_reservation_liberta_flutter/actions/admin/salon/screens/salon_list_controller.dart';
import 'package:library_reservation_liberta_flutter/actions/rezervasyon/models/reservation_model.dart';

import '../../../widgets/snackbar.dart';
import '../api/reservation_api.dart';

class ReservationViewController extends GetxController {
  RxBool reservationAramaLoading =
      true.obs; //Rezervasyon arama butonuyla tetiklenir.
  RxBool reservationListLoading =
      true.obs; //Rezervasyon arama apide istekte bulunurken shimmer icin.

  // var selectedIndexColor = Colors.green.obs;
  // var disabledIndexColor = Colors.red;
  // var emptyIndexColor = Colors.grey[200];

  // var selectedIndex = 0.obs;
  var groupValue = ''.obs;
  // var isChecked = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  List<ReservationModel> reservationList =
      <ReservationModel>[].obs; //Api den gelen rezervasyon listemiz.

  SalonModel?
      salonModel; //SalonList den rezervasyon butonuyla rezervasyon ekranina constructor ile gelen salon modelimiz. rezervasyonView de  constructor ile esitlenir.

  //TARIH VE SAAT ALANI ************************************************** Start
  //Tarih
  RxString rezervasyonBaslangicTarihi = ''.obs;
  RxString rezervasyonBitisTarihi = ''.obs;
  //Saat
  RxString rezervasyonBaslangicSaati = ''.obs;
  RxString rezervasyonBitisSaati = ''.obs;

  //Formatlama
  Rx<DateTime> rezervasyonMinBitisTarihiAndBaslangicCurrentDate = DateTime.now()
      .obs; // Ayarlanan tarih hem secili olmasi icin hem bitis tarihinin secebilecegi min tarih icin gerekli.
  Rx<DateTime> rezervasyonBitisTarihiCurrentDate = DateTime.now()
      .obs; //Ayarlanan tarih current time ile secili olmasi icin gerekli.
  Rx<DateTime> rezervasyonMinBitisSaatiAndBaslangicCurrentTime = DateTime.now()
      .obs; //Ayarlanan saat icin secilen saat degerinin tekrar gozukmesi ve bitis saat degerinin baslangic degerinin atanmasi icin gerekli.
  Rx<DateTime> rezervasyonBitisSaatCurrentTime = DateTime.now()
      .obs; //Ayarlanan saat current time ile secili olmasi icin gerekli.

  //Tarih Ve Saat Alani ----------------------------------------------------- End;

  //Api ************************************************************************* Start;

//ReservationView Bloklar Listeleme Icin CrossScroll Ekran Boyutu arama Sandalye Adetine gore. MaxHeigt Belirleme.
  RxDouble blokSandalyeAdetiUiMaxHeight = 128.0.obs;
  reservationViewBlokSandalyeAdetineGoreMaxHeight(context) {
    int blokSandalyeAdeti = 0;
    if (reservationList != null) {
      for (var blokList in reservationList) {
        if (blokList.masayaAitSandalyeler != null) {
          if (blokList.masayaAitSandalyeler!.length > blokSandalyeAdeti) {
            blokSandalyeAdeti = blokList.masayaAitSandalyeler!.length;
          }
        }
      }
    }

    if (blokSandalyeAdeti >= 20) {
      blokSandalyeAdetiUiMaxHeight.value =
          MediaQuery.of(context).size.height * 0.7;
    } else if (blokSandalyeAdeti >= 15) {
      blokSandalyeAdetiUiMaxHeight.value =
          MediaQuery.of(context).size.height * 0.6;
    } else if (blokSandalyeAdeti >= 10) {
      blokSandalyeAdetiUiMaxHeight.value =
          MediaQuery.of(context).size.height * 0.5;
    } else if (blokSandalyeAdeti >= 5) {
      blokSandalyeAdetiUiMaxHeight.value =
          MediaQuery.of(context).size.height * 0.3;
    } else if (blokSandalyeAdeti >= 0) {
      blokSandalyeAdetiUiMaxHeight.value =
          MediaQuery.of(context).size.height * 0.2;
    } else {
      blokSandalyeAdetiUiMaxHeight.value =
          128.0; //Default Hic sandalye listelenmez ise .
    }
  }

  fetchReservation(context) async {
    //Rezervayon Ara butonuyla ilgili veriler api den istekte bulunup rezervasyon listesini aliriz.
    reservationAramaLoading.value = false; // Rezervasyon ara butonu kontolu.
    reservationListLoading.value =
        true; //Api ye istekte bulununca aktif edilir ve shimmer gosterilir.
    try {
      if (rezervasyonBaslangicTarihi.value != '' &&
          rezervasyonBitisTarihi.value != '' &&
          rezervasyonBaslangicSaati.value != '' &&
          rezervasyonBitisSaati.value != '' &&
          salonModel != null &&
          salonModel!.salonId != null) {
        var list = await ReservationApi().reservationApi(
            rezervasyonBaslangicTarihi.value,
            rezervasyonBitisTarihi.value,
            rezervasyonBaslangicSaati.value,
            rezervasyonBitisSaati.value,
            salonModel!.salonId!);
        if (list != null) {
          reservationList = list;
          reservationListLoading.value =
              false; //Liste null gelmez ise shimmer devreden cikar.

          reservationViewBlokSandalyeAdetineGoreMaxHeight(
              context); // bu bize blokSandalyelerimizin alanini belirler MaxHeight degerimiz icin gerekli
        } else {
          reservationList.clear();
          reservationAramaLoading.value =
              true; // rezervasyon listemiz null gelir ise
          infoSnackbar("Rezervasyon Bulunamadı!",
              'Arama yaptığınız bilgilerde herhangi bir sonuç bulunamadı. ');
        }
      } else {
        errorSnackbar(
            "Eksik Bilgi!", 'Tarih ve saat alanlarını boş bırakmayınız. ');
        reservationAramaLoading.value =
            true; //Reservasyon arama tekrar aktif edilir. Degerler bos gelir ise
      }
    } catch (e) {
      print('Rezervasyon Listeleme : fetchReservation() ' + e.toString());
    }
  }
  //Api  ----------------------------------------------------------------------- End;
}
