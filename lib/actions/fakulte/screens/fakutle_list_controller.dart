import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:library_reservation_liberta_flutter/actions/fakulte/api/fakulte_api.dart';
import 'package:library_reservation_liberta_flutter/actions/fakulte/models/fakulte_model.dart';

class FakulteListController extends GetxController {
  var isLoading = true.obs;

  var fakulteModelList = <FakulteModel>[].obs;
  var searchFakulteList = <FakulteModel>[].obs;

  @override
  void onInit() {
    getFakulteList();
    // TODO: implement onInit
    super.onInit();
  }

  getFakulteList() async {
    try {
      var fakulteModelApi = await FakulteApi().getFakulteListApi();

      if (fakulteModelApi != null) {
        fakulteModelList.assignAll(fakulteModelApi);

        //Search
        searchFakulteList.clear();
        searchFakulteList.addAll(fakulteModelList);
      }
    } finally {
      isLoading.value = false;
    }
  }

  searchFakulte(String value) {
    if (value.isNotEmpty) {
      var searchListData = <FakulteModel>[];
      for (var element in fakulteModelList) {
        if (element.fakulteAdi != null &&
            element.fakulteAdi!.toLowerCase().contains(value.toLowerCase())) {
          searchListData.add(element);
        }
      }
      searchFakulteList.clear();
      searchFakulteList.addAll(searchListData);
      return;
    } else {
      searchFakulteList.clear();
      searchFakulteList.addAll(fakulteModelList);
    }
  }
}
