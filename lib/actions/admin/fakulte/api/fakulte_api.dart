import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../api/base_api.dart';
import '../../../../core/login/auth_manager.dart';
import '../models/fakulte_model.dart';

class FakulteApi {
  Future<List<FakulteModel>?> getFakulteListApi() async {
    final AuthenticationManager _authenticationManager = Get.find();

    final Uri _fakulteListUrl =
        Uri.parse(BaseApi.apiBaseUrl + "Fakulte/GetFakulteListesi");

    try {
      String? _userToken = _authenticationManager.getToken();
      final response = await http.get(
        _fakulteListUrl,
        headers: {
          'Authorization': 'Bearer $_userToken',
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
        List<FakulteModel>? data =
            body.map((dynamic item) => FakulteModel.fromJson(item)).toList();

        return data;
      }
    } catch (e) {
      print("FakulteApi : " + e.toString());
    }
    return null;
  }
}
