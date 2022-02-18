import 'package:get/get.dart';
import '/birim/api/birim_api.dart';

import '../model/birim_model.dart';
import 'birim_create_view.dart';

class BirimListController extends GetxController {
  var isLoading = true.obs;
  final RxList birimList = <Birim>[].obs;

  @override
  void onInit() {
    getBirimList();
    super.onInit();
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
