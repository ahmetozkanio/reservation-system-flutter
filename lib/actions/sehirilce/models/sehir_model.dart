// import 'dart:convert';

// List<Sehir> sehirFromJson(String str) => List<Sehir>.from(
//       json.decode(str).map(
//             (x) => Sehir.fromJson(x),
//           ),
//     );

// String sehirToJson(List<Sehir> data) => json.encode(
//       List<dynamic>.from(
//         data.map(
//           (x) => x.toJson(),
//         ),
//       ),
//     );

// class Sehir {
//   int? id;
//   String? adi;
//   bool? aktifMi;

//   Sehir({this.id, this.adi, this.aktifMi});

//   Sehir.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     adi = json['adi'];
//     aktifMi = json['aktifMi'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['adi'] = this.adi;
//     data['aktifMi'] = this.aktifMi;
//     return data;
//   }
// }

class SehirModel {
  List<Data>? data;

  SehirModel({
    this.data,
  });

  SehirModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? sehirId;
  String? adi;

  Data({
    this.sehirId,
    this.adi,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sehirId = json['sehirId'];
    adi = json['adi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sehirId'] = sehirId;
    data['adi'] = adi;
    return data;
  }
}
