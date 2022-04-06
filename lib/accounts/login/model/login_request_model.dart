import 'dart:convert';

class LoginRequestModel {
  String email;
  String sifre;

  LoginRequestModel({
    required this.email,
    required this.sifre,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'sifre': sifre,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      email: map['email'] ?? '',
      sifre: map['sifre'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source));
}
