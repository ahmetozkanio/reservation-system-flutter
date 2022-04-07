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



//  "userId": "fb23c25d-c70a-43f3-9a20-1c7ec20314a7",
//     "email": "ahmet@ozkan.com",
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImZiMjNjMjVkLWM3MGEtNDNmMy05YTIwLTFjN2VjMjAzMTRhNyIsIm5iZiI6MTY0OTIzMTg0NSwiZXhwIjoxNjQ5ODM2NjQ1LCJpYXQiOjE2NDkyMzE4NDV9.CxBqe7v8XqpHuGPZfsuOKZ54qVjHLZq893cliJ6T2ig",
//     "role": 0,
//     "statusCode": 0