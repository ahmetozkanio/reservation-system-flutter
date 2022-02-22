import 'dart:convert';

List<Ilce> ilceFromJson(String str) => List<Ilce>.from(
      json.decode(str).map(
            (x) => Ilce.fromJson(x),
          ),
    );

String ilceToJson(List<Ilce> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class Ilce {
  int? id;
  String? adi;
  int? sehirId;
  bool? aktifMi;

  Ilce({this.id, this.adi, this.sehirId, this.aktifMi});

  Ilce.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adi = json['adi'];
    sehirId = json['sehirId'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adi'] = this.adi;
    data['sehirId'] = this.sehirId;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}
