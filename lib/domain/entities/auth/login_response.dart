import 'package:json_annotation/json_annotation.dart';


part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {

  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'expires_in')
  int? expiresIn;
  @JsonKey(name: 'refresh_expires_in')
  int? refreshExpiresIn;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  @JsonKey(name: 'token_type')
  String? tokenType;
  @JsonKey(name: 'not-before-policy')
  int? notBeforePolicy;
  @JsonKey(name: 'session_state')
  String? sessionState;
  String? scope;


  LoginResponse({this.accessToken, this.expiresIn, this.refreshExpiresIn,
    this.refreshToken, this.tokenType, this.notBeforePolicy, this.sessionState,
    this.scope});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}