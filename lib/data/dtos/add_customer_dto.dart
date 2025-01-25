import 'package:invoice_app/data/dtos/address_dto.dart';
import 'package:invoice_app/data/dtos/contact_dto.dart';

class AddCustomerDto {

  String? tin;
  String name;
  String typeClient;
  String categoryCode;
  String ownerTin;
  ContactDto contact;
  AddressDto invoicingAddress;


  AddCustomerDto({this.tin, required this.name, required this.typeClient,
    required this.categoryCode, required this.ownerTin, required this.contact,
    required this.invoicingAddress});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'typeClient': typeClient,
      'categoryCode': categoryCode,
      'ownerTin': ownerTin,
      'contact': contact.toJson(),
      'invoicingAddress': invoicingAddress.toJson()
    };

    if(tin != null){
      data["tin"] = tin;
    }

    return data;
  }

  factory AddCustomerDto.fromJson(Map<String, dynamic> json) {
    return AddCustomerDto(
      tin: json['tin'],
      name: json['name'],
      typeClient: json['typeClient'],
      categoryCode: json['categoryCode'],
      ownerTin: json['ownerTin'],
      contact: json['contact'],
      invoicingAddress: json['invoicingAddress']
    );
  }

}