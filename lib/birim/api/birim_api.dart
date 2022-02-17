import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/birim/model/birim_model.dart';
import '/api/base_api.dart';
import 'package:dio/dio.dart';

class BirimApi {
  static Future<List<Birim>?> getBirimListApi() async {
    try {
      var response =
          await http.get(Uri.parse(BaseApi.apiBaseUrl + "/api/Birim/list"));
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return birimFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print("BirimApi : " + e.toString());
    }
  }
}
