import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/core/login/auth_manager.dart';

import '../model/salon_model.dart';
import '/api/base_api.dart';

class SalonApi {
  final AuthenticationManager _authenticationManager = Get.find();
  Future<List<SalonModel>?> salonListApi() async {
    final Uri _salonListUrl =
        Uri.parse(BaseApi.apiBaseUrl + "Salon/SalonListesi");

    try {
      String? _userToken = _authenticationManager.getToken();
      final response = await http.get(
        _salonListUrl,
        headers: {
          'Authorization': 'Bearer $_userToken',
          "contentType": "application/json",
        },
      );

      if (response.statusCode == 200) {
        // Map<String, dynamic> json = jsonDecode(response.body);
        // List<dynamic> body = json['data'];
        // print(body);
        // List<BirimModel>? data =
        //     body.map((dynamic item) => BirimModel.fromJson(item)).toList();

        // return data;
      }
    } catch (e) {
      print("SalonListApi : " + e.toString());
    }
    return null;
  }
}
