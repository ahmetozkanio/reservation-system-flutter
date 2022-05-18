class ReservationModel {
  ReservationModel({
    required this.userId,
    required this.bolumId,
    required this.birimId,
    required this.kurumId,
    required this.sandalyeId,
    required this.salonId,
    required this.blokId,
    required this.rezBaslangicTarihi,
    required this.rezBaslangicSaati,
    required this.rastgeleYerlestirme,
    required this.rezBitisSaati,
    required this.rezBitisTarihi,
  });
  late final String userId;
  late final String bolumId;
  late final String birimId;
  late final String kurumId;
  late final String sandalyeId;
  late final String salonId;
  late final String blokId;
  late final String rezBaslangicTarihi;
  late final String rezBaslangicSaati;
  late final bool rastgeleYerlestirme;
  late final String rezBitisSaati;
  late final String rezBitisTarihi;

  ReservationModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    bolumId = json['bolumId'];
    birimId = json['birimId'];
    kurumId = json['kurumId'];
    sandalyeId = json['sandalyeId'];
    salonId = json['salonId'];
    blokId = json['blokId'];
    rezBaslangicTarihi = json['rezBaslangicTarihi'];
    rezBaslangicSaati = json['rezBaslangicSaati'];
    rastgeleYerlestirme = json['rastgeleYerlestirme'];
    rezBitisSaati = json['rezBitisSaati'];
    rezBitisTarihi = json['rezBitisTarihi'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['bolumId'] = bolumId;
    _data['birimId'] = birimId;
    _data['kurumId'] = kurumId;
    _data['sandalyeId'] = sandalyeId;
    _data['salonId'] = salonId;
    _data['blokId'] = blokId;
    _data['rezBaslangicTarihi'] = rezBaslangicTarihi;
    _data['rezBaslangicSaati'] = rezBaslangicSaati;
    _data['rastgeleYerlestirme'] = rastgeleYerlestirme;
    _data['rezBitisSaati'] = rezBitisSaati;
    _data['rezBitisTarihi'] = rezBitisTarihi;
    return _data;
  }
}
