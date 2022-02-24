import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/actions/sehirilce/models/sehir_model.dart';

import '../models/ilce_model.dart';
import '../models/sehir_model.dart';
import '/api/base_api.dart';

class IlceApi {
  static Future<List<Ilce>?> getIlceListApi(int id) async {
    try {
      var response = await http.post(
        Uri.parse(
          BaseApi.apiBaseUrl + "/api/SehirIlce/ilce/list/" + id.toString(),
        ),
      );
      print("ilce : " + response.statusCode.toString());

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return ilceFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print("Ilceler : " + e.toString());
    }
  }
}
