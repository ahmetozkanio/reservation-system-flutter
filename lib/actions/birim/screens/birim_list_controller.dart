import 'package:get/get.dart';
import '../api/birim_api.dart';

import '../model/birim_model.dart';

class BirimListController extends GetxController {
  var isLoading = true.obs;
  var birimList = <Birim>[].obs;
  List<Birim> searchBirimList = <Birim>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBirimList();
    searchBirimList = birimList;
  }

  @override
  void onClose() {
    super.onClose();
    birimList.clear();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getBirimList() async {
    try {
      isLoading(true);
      var birims = await BirimApi.getBirimListApi();

      if (birims != null) {
        birimList.assignAll(birims);
      }
    } finally {
      isLoading(false);
    }
  }

  birimSearch(String? search) {
    searchBirimList = birimList
        .where((birim) => birim.adi!.toLowerCase().contains(search!))
        .toList();
  }
}
