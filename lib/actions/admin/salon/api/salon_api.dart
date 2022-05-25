import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/core/login/auth_manager.dart';

import '../model/salon_model.dart';
import '../model/salon_ozellikleri_model.dart';
import '/api/base_api.dart';

class SalonApi {
  final AuthenticationManager _authenticationManager = Get
      .find(); //Onceden baslatilmis authenticatin manager sinifimiz buradan cagiriyoruz. Token icin.

  Future<List<SalonModel>?> salonListApi(
    String? salonRezervasyonBaslangicTarihi,
    String? salonRezervasyonBitisTarihi,
    String? salonRezervasyonBaslangicSaati,
    String? salonRezervasyonBitisSaati,
    String? salonOzellikAdi,
    String? salonOzellikBirimAdi,
  ) async {
    final Uri _salonListUrl =
        Uri.parse(BaseApi.apiBaseUrl + "Salon/GetAllSalonListFilter");

    try {
      String? _userToken = _authenticationManager
          .getToken(); //Giris yapmis kullanicin tokeni storage den cekiliyor.
      String body = jsonEncode({
        //Salon Listesi default veriler bize sayfa ilk defa acildiginda gelmesi icin gerekli.
        "salonRezervasyonBaslangicTarihi": salonRezervasyonBaslangicTarihi == ''
            ? DateTime.now().year.toString() + '-' + '01' + '-' + '01'
            : salonRezervasyonBaslangicTarihi,
        "salonRezervasyonBitisTarihi": salonRezervasyonBitisTarihi == ''
            ? DateTime.now().year.toString() + '-' + '12' + '-' + '30'
            : salonRezervasyonBitisTarihi,
        "salonRezervasyonBaslangicSaati": salonRezervasyonBaslangicSaati == ''
            ? '01:00'
            : salonRezervasyonBaslangicSaati,
        "salonRezervasyonBitisSaati": salonRezervasyonBitisSaati == ''
            ? '23:55'
            : salonRezervasyonBitisSaati,
        "SalonOzellikAdi": salonOzellikAdi ?? '',
        "SalonOzellikBirimAdi": salonOzellikBirimAdi ?? '',
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

  Future<List<SalonOzellikleriModel>?> salonOzellikleriListApi() async {
    final Uri _salonOzellikleriListUrl =
        Uri.parse(BaseApi.apiBaseUrl + "Salon/GetAllSalonOzellikleri");
    try {
      String? _userToken = _authenticationManager
          .getToken(); //Giris yapmis kullanicin tokeni storage den cekiliyor.

      final response = await http.get(
        _salonOzellikleriListUrl,
        headers: {
          'Authorization': 'Bearer $_userToken',
          'content-type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body =
            json['data']; //Api daki  data : listemize gore getiriyoruz.
        print(body);
        List<SalonOzellikleriModel>? data = body
            .map((dynamic item) => SalonOzellikleriModel.fromJson(item))
            .toList();
        if (data.isNotEmpty) {
          return data;
        } else {
          return null;
        }
      }
    } catch (e) {
      print('SalonOzellikleriListAPi : ' + e.toString());
    }
    return null;
  }
}
