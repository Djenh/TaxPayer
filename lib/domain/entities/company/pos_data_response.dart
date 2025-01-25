import 'package:invoice_app/domain/entities/company/address_entities.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/domain/entities/company/contact_entities.dart';
import 'package:json_annotation/json_annotation.dart';


part 'pos_data_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PosDataResponse {

  String? id;
  String? code;
  String? name;
  AddressEntities? address;
  ContactEntities? contact;
  CompanyTinResponse? company;


  PosDataResponse({this.id, this.code, this.name, this.address, this.contact,
    this.company});

  factory PosDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PosDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PosDataResponseToJson(this);
}