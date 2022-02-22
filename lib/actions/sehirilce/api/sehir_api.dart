import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/actions/sehirilce/models/sehir_model.dart';

import '../models/sehir_model.dart';
import '/api/base_api.dart';

class SehirApi {
  static Future<List<Sehir>?> getSehirListApi() async {
    try {
      var response = await http
          .get(Uri.parse(BaseApi.apiBaseUrl + "/api/SehirIlce/sehir/list"));
      print(" Sehirler" + response.statusCode.toString());

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return sehirFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print("Sehir : " + e.toString());
    }
  }
}
