import 'package:http/http.dart' as http;

import '../model/salon_model.dart';
import '/api/base_api.dart';

class SalonApi {
  static Future<List<Salon>?> getSalonListApi() async {
    try {
      var response =
          await http.get(Uri.parse(BaseApi.apiBaseUrl + "/api/Salon/list"));
      print("Salon Api" + response.statusCode.toString());

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return birimFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print("SalonApi : " + e.toString());
    }
  }
}
