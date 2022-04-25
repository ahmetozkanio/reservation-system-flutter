import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/kurum_api.dart';
import '../models/kurum_model.dart';

class KurumListController extends GetxController {
  var isLoading = true.obs;
  GlobalKey refreshKey = GlobalKey<RefreshIndicatorState>();
  var kurumModelList = <KurumModel>[].obs;
  var searchKurumList = <KurumModel>[].obs;
  @override
  void onInit() {
    getKurumList();
    //search icin kurumlar listesi search listeye ekleniyor.
    // searchKurumList.addAll(kurumModelList);
    super.onInit();
  }

  getKurumList() async {
    try {
      var kurumModelApi = await KurumApi().getKurumListApi();

      if (kurumModelApi != null) {
        kurumModelList.assignAll(kurumModelApi);

        //Search
        searchKurumList.clear();
        searchKurumList.addAll(kurumModelList);
      }
    } finally {
      isLoading.value = false;
    }
  }

  searchKurum(String value) {
    if (value.isNotEmpty) {
      var searchListData = <KurumModel>[];
      for (var element in kurumModelList) {
        if (element.kurumAdi != null &&
            element.kurumAdi!.toLowerCase().contains(value.toLowerCase())) {
          searchListData.add(element);
        }
      }
      searchKurumList.clear();
      searchKurumList.addAll(searchListData);
      return;
    } else {
      searchKurumList.clear();
      searchKurumList.addAll(kurumModelList);
    }
  }
}
