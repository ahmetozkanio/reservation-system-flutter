// List<Birim> birimFromJson(String str) =>
//     List<Birim>.from(json.decode(str).map((x) => Birim.fromJson(x)));

// String birimToJson(List<Birim> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BirimModel {
  BirimModel({
    required this.birimId,
    required this.kurumId,
    required this.birimAdi,
    required this.birimUnvan,
    required this.sehirId,
    required this.ilceId,
    required this.yetki,
    required this.aktifMi,
  });
  late final String birimId;
  late final String kurumId;
  late final String birimAdi;
  late final String birimUnvan;
  late final int sehirId;
  late final int ilceId;
  late final String yetki;
  late final bool aktifMi;

  BirimModel.fromJson(Map<String, dynamic> json) {
    birimId = json['birimId'];
    kurumId = json['kurumId'];
    birimAdi = json['birimAdi'];
    birimUnvan = json['birimUnvan'];
    sehirId = json['sehirId'];
    ilceId = json['ilceId'];
    yetki = json['yetki'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['birimId'] = birimId;
    _data['kurumId'] = kurumId;
    _data['birimAdi'] = birimAdi;
    _data['birimUnvan'] = birimUnvan;
    _data['sehirId'] = sehirId;
    _data['ilceId'] = ilceId;
    _data['yetki'] = yetki;
    _data['aktifMi'] = aktifMi;
    return _data;
  }
}
