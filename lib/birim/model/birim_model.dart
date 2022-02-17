import 'dart:convert';

List<Birim> birimFromJson(String str) =>
    List<Birim>.from(json.decode(str).map((x) => Birim.fromJson(x)));

String birimToJson(List<Birim> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Birim {
  int? id;
  String? adi;
  dynamic unvan;
  bool? aktifMi;
  String? yetkiliKisi;
  String? email;
  String? cepTelefon;
  String? ofisTelefon;
  String? sehirAdi;
  String? ilceAdi;
  int? ilceId;
  int? sehirId;

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
      this.ilceId,
      this.sehirId});

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
    ilceId = json['ilceId'];
    sehirId = json['sehirId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['adi'] = adi;
    data['unvan'] = unvan;
    data['aktifMi'] = aktifMi;
    data['yetkiliKisi'] = yetkiliKisi;
    data['email'] = email;
    data['cepTelefon'] = cepTelefon;
    data['ofisTelefon'] = ofisTelefon;
    data['sehirAdi'] = sehirAdi;
    data['ilceAdi'] = ilceAdi;
    data['ilceId'] = ilceId;
    data['sehirId'] = sehirId;
    return data;
  }
}
