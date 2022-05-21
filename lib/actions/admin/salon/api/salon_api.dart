import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/core/login/auth_manager.dart';

import '../model/salon_model.dart';
import '/api/base_api.dart';

class SalonApi {
  final AuthenticationManager _authenticationManager = Get
      .find(); //Onceden baslatilmis authenticatin manager sinifimiz buradan cagiriyoruz. Token icin.

  Future<List<SalonModel>?> salonListApi(
    String salonRezervasyonBaslangicTarihi,
    String salonRezervasyonBitisTarihi,
    String salonRezervasyonBaslangicSaati,
    String salonRezervasyonBitisSaati,
    String salonOzellikAdi,
    String salonOzellikBirimAdi,
  ) async {
    final Uri _salonListUrl =
        Uri.parse(BaseApi.apiBaseUrl + "Salon/SalonListesi");

    try {
      String? _userToken = _authenticationManager
          .getToken(); //Giris yapmis kullanicin tokeni storage den cekiliyor.
      String body = jsonEncode({
        "salonRezervasyonBaslangicTarihi": "2022-04-24",
        "salonRezervasyonBitisTarihi": "2022-05-01",
        "salonRezervasyonBaslangicSaati": salonRezervasyonBaslangicSaati,
        "salonRezervasyonBitisSaati": salonRezervasyonBitisSaati,
        "SalonOzellikAdi": salonOzellikAdi,
        "SalonOzellikBirimAdi": salonOzellikBirimAdi,
      });

      final response = await http.post(
        _salonListUrl,
        headers: {
          'Authorization': 'Bearer $_userToken',
          'content-type': 'application/json',
        },
        body: body,
      );
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body =
            json['data']; //Api daki  data : listemize gore getiriyoruz.
        print(body);
        List<SalonModel>? data =
            body.map((dynamic item) => SalonModel.fromJson(item)).toList();
        if (data.isNotEmpty) {
          return data;
        } else {
          return null;
        }
      }
    } catch (e) {
      print("SalonListApi : " + e.toString());
      return null;
    }
    return null;
  }
}
