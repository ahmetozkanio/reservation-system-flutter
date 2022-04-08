class KurumModel {
  KurumModel({
    required this.kurumId,
    required this.kurumAdi,
    required this.kurumUnvan,
    required this.sehirId,
    required this.ilceId,
    required this.aktifMi,
  });
  late final String kurumId;
  late final String? kurumAdi;
  late final String? kurumUnvan;
  late final int? sehirId;
  late final int? ilceId;
  late final bool? aktifMi;

  KurumModel.fromJson(Map<String, dynamic> json) {
    kurumId = json['kurumId'];
    kurumAdi = json['kurumAdi'];
    kurumUnvan = json['kurumUnvan'];
    sehirId = json['sehirId'];
    ilceId = json['ilceId'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kurumId'] = kurumId;
    _data['kurumAdi'] = kurumAdi;
    _data['kurumUnvan'] = kurumUnvan;
    _data['sehirId'] = sehirId;
    _data['ilceId'] = ilceId;
    _data['aktifMi'] = aktifMi;
    return _data;
  }
}
