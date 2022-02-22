import 'dart:convert';

List<Sehir> sehirFromJson(String str) => List<Sehir>.from(
      json.decode(str).map(
            (x) => Sehir.fromJson(x),
          ),
    );

String sehirToJson(List<Sehir> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class Sehir {
  int? id;
  String? adi;
  bool? aktifMi;

  Sehir({this.id, this.adi, this.aktifMi});

  Sehir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adi = json['adi'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adi'] = this.adi;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}
