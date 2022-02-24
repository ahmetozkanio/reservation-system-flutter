import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/birim_model.dart';
import '/api/base_api.dart';

class BirimApi extends GetConnect {
  static Future<List<Birim>?> getBirimListApi() async {
    try {
      var response =
          await http.get(Uri.parse(BaseApi.apiBaseUrl + "/api/Birim/list"));
      print("Birim Api" + response.statusCode.toString());

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

  static Future<bool?> postBirimCreate(
    bool? aktifMi,
    String adi,
    int? sehirId,
    int? ilceId,
    String? yetkiliKisi,
    String? email,
    String? cepTelefon,
    String? ofisTelefon,
  ) async {
    final url = Uri.parse(BaseApi.apiBaseUrl + '/api/Birim/kayit');
    final headers = {"Content-Type": "application/json-patch+json"};
    Map jsonMap = {
      "aktifMi": aktifMi,
      "adi": adi,
      "sehirId": sehirId,
      "ilceId": ilceId,
      "yetkiliKisi": yetkiliKisi,
      "email": email,
      "cepTelefon": cepTelefon,
      "ofisTelefon": ofisTelefon
    };
    String body = json.encode(jsonMap);

    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 201) {
      return Future<bool>.value(true);
    } else {}
  }
}
