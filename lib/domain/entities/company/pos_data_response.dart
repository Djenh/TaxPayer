import 'package:json_annotation/json_annotation.dart';


part 'pos_data_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PosDataResponse {

  String? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? companyTin;

  PosDataResponse({this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.companyTin});

  factory PosDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PosDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PosDataResponseToJson(this);
}