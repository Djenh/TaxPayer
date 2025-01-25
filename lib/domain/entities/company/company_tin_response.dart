import 'package:invoice_app/domain/entities/company/address_entities.dart';
import 'package:invoice_app/domain/entities/company/contact_entities.dart';
import 'package:invoice_app/domain/entities/company/legal_form_entities.dart';
import 'package:invoice_app/domain/entities/company/sector_entities.dart';
import 'package:json_annotation/json_annotation.dart';


part 'company_tin_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyTinResponse {

  String? id;
  String? name;
  String? tin;
  String? tradeNo;
  String? phoneNumber;
  String? email;
  AddressEntities? address;
  ContactEntities? contact;
  LegalFormEntities? legalForm;
  List<SectorEntities>? sectors;
  String? websiteUrl;
  String? status;
  int? totalPos;

  CompanyTinResponse({this.id,
    this.name,
    this.tin,
    this.tradeNo,
    this.phoneNumber,
    this.email,
    this.address,
    this.contact,
    this.legalForm,
    this.sectors,
    this.websiteUrl,
    this.status,
    this.totalPos});

  factory CompanyTinResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyTinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyTinResponseToJson(this);
}