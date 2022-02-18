import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/api/salon_api.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/model/salon_model.dart';

class SalonListController extends GetxController {
  var isLoading = true.obs;
  final RxList salonList = <Salon>[].obs;

  @override
  void onInit() {
    getSalonList();
    super.onInit();
  }

  getSalonList() async {
    try {
      isLoading(true);
      var salons = await SalonApi.getSalonListApi();

      if (salons != null) {
        salonList.assignAll(salons);
      }
    } finally {
      isLoading(false);
    }
  }
}
