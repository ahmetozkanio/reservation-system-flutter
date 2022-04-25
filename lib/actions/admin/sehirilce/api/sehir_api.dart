import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../../../core/login/auth_manager.dart';
import '../models/sehir_model.dart';
import '/api/base_api.dart';

class SehirApi {
  final AuthenticationManager _authenticationManager = Get.find();

  final Uri sehirListUrl =
      Uri.parse(BaseApi.apiBaseUrl + "sehirIlce/sehirListesi");

  Future<List<SehirModel>?> getSehirList() async {
    String? userToken = _authenticationManager.getToken();
    final response = await http.get(
      sehirListUrl,
      headers: {
        'contentType': " application/json",
        'Authorization': 'Bearer $userToken',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['data'];
      List<SehirModel>? data =
          body.map((dynamic item) => SehirModel.fromJson(item)).toList();
      return data;
    } else {
      return null;
    }
  }
}
