import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/login/auth_manager.dart';
import '../model/birim_model.dart';
import '/api/base_api.dart';

class BirimApi {
  final AuthenticationManager _authenticationManager = Get.find();
  Future<List<BirimModel>?> getBirimListApi() async {
    final Uri _birimListUrl =
        Uri.parse(BaseApi.apiBaseUrl + "Birim/BirimListesi");

    try {
      String? _userToken = _authenticationManager.getToken();
      final response = await http.get(
        _birimListUrl,
        headers: {
          'Authorization': 'Bearer $_userToken',
          "contentType": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['data'];
        print(body);
        List<BirimModel>? data =
            body.map((dynamic item) => BirimModel.fromJson(item)).toList();

        return data;
      }
    } catch (e) {
      print("BirimListApi : " + e.toString());
    }
    return null;
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
    } else {
      Future<bool>.value(false);
    }
    return null;
  }

  static Future<bool?> putUpdateBirim(
    int? id,
    bool? aktifMi,
    String adi,
    int? sehirId,
    int? ilceId,
    String? yetkiliKisi,
    String? email,
    String? cepTelefon,
    String? ofisTelefon,
  ) async {
    final url = Uri.parse(BaseApi.apiBaseUrl + '/api/Birim/guncelle/$id');
    final headers = {"Content-Type": "application/json-patch+json"};
    Map jsonMap = {
      "id": id,
      //"aktifMi": aktifMi,
      "adi": adi,
      "sehirId": sehirId,
      "ilceId": ilceId,
      "yetkiliKisi": yetkiliKisi,
      "email": email,
      "cepTelefon": cepTelefon,
      "ofisTelefon": ofisTelefon
    };
    String body = json.encode(jsonMap);

    final response = await http.put(url, headers: headers, body: body);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 204) {
      return Future<bool>.value(true);
    } else {
      Future<bool>.value(false);
    }
    return null;
  }

  static Future<bool> putDeleteBirim(int id) async {
    final url = Uri.parse(BaseApi.apiBaseUrl + '/api/Birim/sil/$id');
    final headers = {"Content-Type": "application/json-patch+json"};
    Map jsonMap = {
      "id": id,
    };
    String body = json.encode(jsonMap);

    final response = await http.put(url, headers: headers, body: body);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 204) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }
}
