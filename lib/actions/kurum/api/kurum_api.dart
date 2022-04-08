import 'dart:convert';

import 'package:get/get.dart';

import 'package:library_reservation_liberta_flutter/actions/kurum/models/kurum_model.dart';

import 'package:library_reservation_liberta_flutter/core/login/auth_manager.dart';

import '../../../api/base_api.dart';
import 'package:http/http.dart' as http;

class KurumApi {
  final AuthenticationManager _authenticationManager = Get.find();

  final Uri kurumListUrl = Uri.parse(BaseApi.apiBaseUrl + "Kurum/KurumListesi");
  Future<List<KurumModel>?> getKurumListApi() async {
    try {
      String? userToken = _authenticationManager.getToken();
      final response = await http.get(
        kurumListUrl,
        headers: {
          'Authorization': 'Bearer $userToken',
          "contentType": "application/json",
        },
      );
      //print("kurumApi : " + response.bodyString.toString());
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['data'];
        print(body);
        List<KurumModel>? data =
            body.map((dynamic item) => KurumModel.fromJson(item)).toList();

        return data;
      }
    } catch (e) {
      print("KurumApi : " + e.toString());
    }
    return null;
  }
}
