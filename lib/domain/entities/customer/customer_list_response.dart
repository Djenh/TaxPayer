import 'package:invoice_app/domain/entities/company/address_entities.dart';
import 'package:invoice_app/domain/entities/company/contact_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';

part 'customer_list_response.g.dart';


@JsonSerializable(explicitToJson: true)
class CustomerListResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<CustomerEntities>? content;
  int? number;
  List<String>? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? empty;


  CustomerListResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number, this.sort,
    this.numberOfElements, this.pageable, this.empty});

  factory CustomerListResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerListResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class CustomerEntities {

  String? id;
  String? code;
  String? tin;
  String? name;
  String? typeClient;
  CategoriesEntities? category;
  String? ownerTin;
  ContactEntities? contact;
  AddressEntities? invoicingAddress;
  String? status;
  bool? dropped;


  CustomerEntities({this.id, this.code, this.tin, this.name, this.typeClient,
    this.category, this.ownerTin, this.contact, this.invoicingAddress,
    this.status, this.dropped});

  factory CustomerEntities.fromJson(Map<String, dynamic> json) =>
      _$CustomerEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerEntitiesToJson(this);
}