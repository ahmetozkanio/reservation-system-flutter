import 'dart:convert';

List<SehirIlce> birimFromJson(String str) => List<SehirIlce>.from(
      json.decode(str).map(
            (x) => SehirIlce.fromJson(x),
          ),
    );

String birimToJson(List<SehirIlce> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class SehirIlce {
  int? id;
  String? adi;
  bool? aktifMi;

  SehirIlce({this.id, this.adi, this.aktifMi});

  SehirIlce.fromJson(Map<String, dynamic> json) {
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
