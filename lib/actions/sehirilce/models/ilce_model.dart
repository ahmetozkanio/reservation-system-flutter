class IlceModel {
  IlceModel({
    required this.ilceId,
    required this.ilceAdi,
    required this.sehirId,
  });
  late final int ilceId;
  late final String ilceAdi;
  late final int sehirId;

  IlceModel.fromJson(Map<String, dynamic> json) {
    ilceId = json['ilceId'];
    ilceAdi = json['ilceAdi'];
    sehirId = json['sehirId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ilceId'] = ilceId;
    _data['ilceAdi'] = ilceAdi;
    _data['sehirId'] = sehirId;
    return _data;
  }
}
