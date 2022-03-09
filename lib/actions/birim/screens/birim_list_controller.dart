import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/widgets/snackbar.dart';
import '../api/birim_api.dart';

import '../model/birim_model.dart';

class BirimListController extends GetxController {
  var isLoading = true.obs;
  static bool birimApiResponse = false;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

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

  Future<bool> deleteBirim(int id) async {
    try {
      var deleteBirim = await BirimApi.putDeleteBirim(id);

      if (deleteBirim) {
        birimApiResponse = true;
        getBirimList();

        return true;
      } else {
        return false;
      }
    } finally {}
  }

  getBirimList() async {
    try {
      isLoading(true);
      var birims = await BirimApi.getBirimListApi();

      if (birims != null) {
        searchBirimList.clear();
        birimList.assignAll(birims);
        searchBirimList.addAll(birimList);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshBirimList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));
    await getBirimList();
  }

  searchBirim(String value) {
    if (value.isNotEmpty) {
      var searchListData = <Birim>[];
      for (var element in birimList) {
        if (element.adi != null &&
            element.adi!.toLowerCase().contains(value.toLowerCase())) {
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
}
