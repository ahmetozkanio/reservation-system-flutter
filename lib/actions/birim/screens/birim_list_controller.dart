import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/birim_api.dart';

import '../model/birim_model.dart';

class BirimListController extends GetxController {
  var isLoading = true.obs;
  var birimList = <Birim>[].obs;
  var searchBirimList = <Birim>[].obs;

  TextEditingController searchTextCtrl = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getBirimList();
    searchBirimList.addAll(birimList);
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
        searchBirimList.addAll(birimList);
      }
    } finally {
      isLoading(false);
    }
  }

  searchBirim(String value) {
    // var searchList = <Birim>[];

    // searchList.addAll(searchBirimList);

    if (value.isNotEmpty) {
      var searchListData = <Birim>[];
      for (var element in birimList) {
        if (element.adi!.toLowerCase().contains(value.toLowerCase())) {
          searchListData.add(element);
        }
      }
      searchBirimList.clear();
      searchBirimList.addAll(searchListData);
      return;
    } else {
      searchBirimList.clear();
      searchBirimList.addAll(birimList);
    }
  }

  // void filterSearchResults(String query) {
  //   List<String> dummySearchList = [];
  //   dummySearchList.addAll(duplicateItems);
  //   if (query.isNotEmpty) {
  //     List<String> dummyListData = [];
  //     dummySearchList.forEach((item) {
  //       if (item.contains(query)) {
  //         dummyListData.add(item);
  //       }
  //     });
  //     setState(() {
  //       items.clear();
  //       items.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       items.clear();
  //       items.addAll(duplicateItems);
  //     });
  //   }
  // }
}
