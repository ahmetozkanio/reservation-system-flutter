import 'dart:convert';

import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/rezervasyon/models/reservation_model.dart';

import '../../../api/base_api.dart';
import '../../../core/login/auth_manager.dart';
import 'package:http/http.dart' as http;

class ReservationApi {
  final AuthenticationManager _authenticationManager = Get
      .find(); //Onceden baslatilmis authenticatin manager sinifimiz buradan cagiriyoruz. Token icin.

  Future<List<ReservationModel>?> reservationApi(
    String rezervasyonBaslangicTarihi,
    String rezervasyonBitisTarihi,
    String rezervasyonBaslangicSaati,
    String rezervasyonBitisSaati,
    String salonId,
  ) async {
    final Uri _reservationUrl =
        Uri.parse(BaseApi.apiBaseUrl + "Blok/BlokListBySalonId");

    try {
      String? _userToken = _authenticationManager
          .getToken(); //Giris yapmis kullanicin tokeni storage den cekiliyor.
      String body = jsonEncode({
        "rezBaslangicTarihi": "2022-04-24",
        "rezBitisTarihi": "2022-05-01",
        "rezBaslangicSaati": rezervasyonBaslangicSaati,
        "rezBitisSaati": rezervasyonBitisSaati,
        "salonId": salonId,
      });

      final response = await http.post(
        _reservationUrl,
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
        List<ReservationModel>? data = body
            .map((dynamic item) => ReservationModel.fromJson(item))
            .toList();
        if (data.isNotEmpty) {
          return data;
        } else {
          return null;
        }
      }
    } catch (e) {
      print("ReservationApi : " + e.toString());
      return null;
    }
    return null;
  }
}
