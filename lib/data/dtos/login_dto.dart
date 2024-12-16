class LoginDto {

  String email;
  String password;

  LoginDto({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'email': email,
      'password': password
    };
    return data;
  }

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
        email: json['email'],
        password: json['password'],
    );
  }
}
