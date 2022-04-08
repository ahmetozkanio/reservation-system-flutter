import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'package:library_reservation_liberta_flutter/actions/sehirilce/models/sehir_model.dart';
import 'package:library_reservation_liberta_flutter/core/login/auth_cache_manager.dart';

import '../models/sehir_model.dart';
import '/api/base_api.dart';

// class SehirApi {
//   static Future<List<Sehir>?> getSehirListApi() async {
//     try {
//       var response = await http
//           .get(Uri.parse(BaseApi.apiBaseUrl + "SehirIlce/SehirListesi/"));
//       print(" Sehirler" + response.statusCode.toString());

//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         return sehirFromJson(jsonString);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print("Sehir : " + e.toString());
//     }
//   }
// }

class SehirApi extends GetConnect with AuthCacheManager {
  String sehirUrl = BaseApi.apiBaseUrl + 'SehirIlce/SehirListesi/';

  Future<SehirModel?> getSehirList() async {
    String? userToken = getToken();
    final response = await get(
      sehirUrl,
      contentType: " application/json",
      headers: {
        'Authorization': 'Bearer $userToken',
      },
    );

    if (response.statusCode == 200) {
      return SehirModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
