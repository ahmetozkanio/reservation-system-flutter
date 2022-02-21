import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/actions/sehirilce/models/sehirilce_model.dart';

import '/api/base_api.dart';

class SehirIlceApi {
  static Future<List<SehirIlce>?> getSehirIlceListApi() async {
    try {
      var response = await http
          .get(Uri.parse(BaseApi.apiBaseUrl + "/api/SehirIlce/sehir/list"));
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return birimFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print("SehirIlce : " + e.toString());
    }
  }
}
