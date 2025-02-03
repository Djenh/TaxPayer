import 'package:dio/dio.dart';

class LoginDto {
  String clientId;
  String username;
  String password;
  String grantType;

  LoginDto({
    required this.clientId,
    required this.username,
    required this.password,
    this.grantType = "password",
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'client_id': clientId,
      'username': username,
      'password': password,
      'grant_type': grantType,
    };

    return data;
  }

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      clientId: json['client_id'],
      username: json['username'],
      password: json['password'],
      grantType: json['grant_type'],
    );
  }

  Future<String> toUrlEncoded() async {
    return "client_id=$clientId&username=$username&password=$password&grant_type=$grantType";
  }


}

