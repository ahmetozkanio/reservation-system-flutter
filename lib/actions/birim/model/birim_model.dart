import 'dart:convert';

List<Birim> birimFromJson(String str) =>
    List<Birim>.from(json.decode(str).map((x) => Birim.fromJson(x)));

String birimToJson(List<Birim> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Birim {
  int? id;
  String? adi;
  Null? unvan;
  bool? aktifMi;
  String? yetkiliKisi;
  String? email;
  String? cepTelefon;
  String? ofisTelefon;
  String? sehirAdi;
  String? ilceAdi;
  String? backgroundColor;
  String? color;
  int? ilceId;
  int? sehirId;
  String? tableColor;
  String? tableBackgroundColor;

  Birim(
      {this.id,
      this.adi,
      this.unvan,
      this.aktifMi,
      this.yetkiliKisi,
      this.email,
      this.cepTelefon,
      this.ofisTelefon,
      this.sehirAdi,
      this.ilceAdi,
      this.backgroundColor,
      this.color,
      this.ilceId,
      this.sehirId,
      this.tableColor,
      this.tableBackgroundColor});

  Birim.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adi = json['adi'];
    unvan = json['unvan'];
    aktifMi = json['aktifMi'];
    yetkiliKisi = json['yetkiliKisi'];
    email = json['email'];
    cepTelefon = json['cepTelefon'];
    ofisTelefon = json['ofisTelefon'];
    sehirAdi = json['sehirAdi'];
    ilceAdi = json['ilceAdi'];
    backgroundColor = json['backgroundColor'];
    color = json['color'];
    ilceId = json['ilceId'];
    sehirId = json['sehirId'];
    tableColor = json['tableColor'];
    tableBackgroundColor = json['tableBackgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adi'] = this.adi;
    data['unvan'] = this.unvan;
    data['aktifMi'] = this.aktifMi;
    data['yetkiliKisi'] = this.yetkiliKisi;
    data['email'] = this.email;
    data['cepTelefon'] = this.cepTelefon;
    data['ofisTelefon'] = this.ofisTelefon;
    data['sehirAdi'] = this.sehirAdi;
    data['ilceAdi'] = this.ilceAdi;
    data['backgroundColor'] = this.backgroundColor;
    data['color'] = this.color;
    data['ilceId'] = this.ilceId;
    data['sehirId'] = this.sehirId;
    data['tableColor'] = this.tableColor;
    data['tableBackgroundColor'] = this.tableBackgroundColor;
    return data;
  }
}
