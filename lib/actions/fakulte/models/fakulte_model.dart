class FakulteModel {
  FakulteModel({
    required this.fakulteId,
    required this.fakulteAdi,
    required this.fakulteKodu,
    required this.aktifMi,
  });
  late final String fakulteId;
  late final String? fakulteAdi;
  late final String? fakulteKodu;
  late final bool aktifMi;

  FakulteModel.fromJson(Map<String, dynamic> json) {
    fakulteId = json['fakulteId'];
    fakulteAdi = json['fakulteAdi'];
    fakulteKodu = json['fakulteKodu'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fakulteId'] = fakulteId;
    _data['fakulteAdi'] = fakulteAdi;
    _data['fakulteKodu'] = fakulteKodu;
    _data['aktifMi'] = aktifMi;
    return _data;
  }
}
