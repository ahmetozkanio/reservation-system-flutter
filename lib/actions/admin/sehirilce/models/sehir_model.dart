class SehirModel {
  int? sehirId;
  String? adi;

  SehirModel({
    this.sehirId,
    this.adi,
  });

  SehirModel.fromJson(Map<String, dynamic> json) {
    sehirId = json['sehirId'];
    adi = json['adi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sehirId'] = sehirId;
    data['adi'] = adi;
    return data;
  }
}
