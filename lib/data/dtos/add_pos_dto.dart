import 'package:invoice_app/data/dtos/address_dto.dart';
import 'package:invoice_app/data/dtos/contact_dto.dart';

class AddPosDto {

  String name;
  String tin;
  AddressDto address;
  ContactDto contact;

  AddPosDto({required this.name, required this.tin, required this.address,
    required this.contact});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'tin': tin,
      'address': address.toJson(),
      'contact': contact.toJson()
    };
    return data;
  }

  factory AddPosDto.fromJson(Map<String, dynamic> json) {
    return AddPosDto(
      name: json['name'],
      tin: json['tin'],
      address: json['address'],
      contact: json['contact'],
    );
  }
}
