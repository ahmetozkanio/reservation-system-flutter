import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/actions/sehirilce/models/sehir_model.dart';

import '../../../core/login/auth_manager.dart';
import '../models/ilce_model.dart';
import '../models/sehir_model.dart';
import '/api/base_api.dart';

class IlceApi {
  Future<List<IlceModel>?> getIlceListApi(int sehirId) async {
    final AuthenticationManager _authenticationManager = Get.find();

    final Uri ilceListUrl = Uri.parse(BaseApi.apiBaseUrl +
        "SehirIlce/IlceListesi?SehirId=" +
        sehirId.toString());
    try {
      var userToken = _authenticationManager.getToken();

      var response = await http.post(
        ilceListUrl,
        headers: {
          'Authorization': 'Bearer $userToken',
          "contentType": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['data'];

        List<IlceModel>? data =
            body.map((dynamic item) => IlceModel.fromJson(item)).toList();
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print("Ilceler : " + e.toString());
    }
    return null;
  }
}
