class LoginResponseModel {
  late String userId;
  String? email;
  late String token;
  int? role;
  int? statusCode;

  LoginResponseModel({
    required this.userId,
    required this.email,
    required this.token,
    required this.role,
    this.statusCode,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    token = json['token'];
    role = json['role'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['email'] = email;
    data['token'] = token;
    data['role'] = role;
    data['statusCode'] = statusCode;
    return data;
  }
}
