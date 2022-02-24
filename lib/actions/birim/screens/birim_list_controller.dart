import 'package:get/get.dart';
import '../api/birim_api.dart';

import '../model/birim_model.dart';
import 'birim_create_view.dart';

class BirimListController extends GetxController {
  var isLoading = true.obs;
  final RxList birimList = <Birim>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBirimList();
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
}
