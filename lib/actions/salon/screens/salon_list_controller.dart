import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/api/salon_api.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/model/salon_model.dart';

class SalonListController extends GetxController {
  var isLoading = true.obs;
  var salonList = <Salon>[].obs;
  var searchSalonList = <Salon>[].obs;
  @override
  void onInit() {
    super.onInit();
    getSalonList();

    searchSalonList.addAll(salonList);
  }

  getSalonList() async {
    try {
      isLoading(true);
      var salons = await SalonApi.getSalonListApi();

      if (salons != null) {
        salonList.assignAll(salons);
        searchSalonList.addAll(salonList);
      }
    } finally {
      isLoading(false);
    }
  }

  searchSalon(String value) {
    //var searchList = <Salon>[];

    //searchList.addAll(searchSalonList);

    if (value.isNotEmpty) {
      var searchListData = <Salon>[];
      for (var element in salonList) {
        if (element.adi!.toLowerCase().contains(value.toLowerCase())) {
          searchListData.add(element);
        }
      }
      searchSalonList.clear();
      searchSalonList.addAll(searchListData);
      return;
    } else {
      searchSalonList.clear();
      searchSalonList.addAll(salonList);
    }
  }
}
