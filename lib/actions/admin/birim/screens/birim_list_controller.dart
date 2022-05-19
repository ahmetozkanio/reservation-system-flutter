// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:library_reservation_liberta_flutter/widgets/snackbar.dart';
// import '../api/birim_api.dart';

// import '../model/birim_model.dart';

// class BirimListController extends GetxController {
//   var isLoading = true.obs;

//   var refreshKey = GlobalKey<RefreshIndicatorState>();

//   var birimList = <BirimModel>[].obs;
//   var searchBirimList = <BirimModel>[].obs;

//   @override
//   void onInit() {
//     getBirimList();
//     // searchBirimList.addAll(birimList);
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     // birimList.clear();
//   }

//   // Future<bool> deleteBirim(int id) async {
//   //   try {
//   //     var deleteBirim = await BirimApi.putDeleteBirim(id);

//   //     if (deleteBirim) {
//   //       birimApiResponse = true;
//   //       getBirimList();

//   //       return true;
//   //     } else {
//   //       return false;
//   //     }
//   //   } finally {}
//   // }

//   getBirimList() async {
//     try {
//       var birims = await BirimApi().getBirimListApi();

//       if (birims != null) {
//         searchBirimList.clear();
//         birimList.assignAll(birims);
//         searchBirimList.addAll(birimList);
//       }
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> refreshBirimList() async {
//     refreshKey.currentState?.show(atTop: false);
//     await Future.delayed(Duration(seconds: 1));
//     await getBirimList();
//   }

//   searchBirim(String value) {
//     if (value.isNotEmpty) {
//       var searchListData = <BirimModel>[];
//       for (var element in birimList) {
//         if (element.birimAdi != null &&
//             element.birimAdi.toLowerCase().contains(value.toLowerCase())) {
//           searchListData.add(element);
//         }
//       }
//       searchBirimList.clear();
//       searchBirimList.addAll(searchListData);
//       return;
//     } else {
//       searchBirimList.clear();
//       searchBirimList.addAll(birimList);
//     }
//   }
// }
