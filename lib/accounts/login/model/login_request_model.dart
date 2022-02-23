class LoginRequestModel {
  String? tc;
  String? sifre;

  LoginRequestModel({this.tc, this.sifre});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tc'] = tc;
    data['sifre'] = sifre;
    return data;
  }
}
