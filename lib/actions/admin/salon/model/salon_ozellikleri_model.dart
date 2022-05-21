class SalonOzellikleriModel {
  int? salonOzellikleriId;
  String? salonId;
  String? salonOzellikAdi;
  bool? aktifMi;

  SalonOzellikleriModel(
      {this.salonOzellikleriId,
      this.salonId,
      this.salonOzellikAdi,
      this.aktifMi});

  SalonOzellikleriModel.fromJson(Map<String, dynamic> json) {
    salonOzellikleriId = json['salonOzellikleriId'];
    salonId = json['salonId'];
    salonOzellikAdi = json['salonOzellikAdi'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salonOzellikleriId'] = this.salonOzellikleriId;
    data['salonId'] = this.salonId;
    data['salonOzellikAdi'] = this.salonOzellikAdi;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}
