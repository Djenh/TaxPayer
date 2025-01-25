import 'package:invoice_app/domain/entities/sort_entities.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'deposit_tax_response.g.dart';


@JsonSerializable(explicitToJson: true)
class DepositTaxResponse {

  List<DepositTaxEntities>? content;
  Pageable1? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  bool? first;
  int? size;
  int? number;
  SortEntities? sort;
  int? numberOfElements;
  bool? empty;


  DepositTaxResponse({this.content, this.pageable, this.last, this.totalPages,
    this.totalElements, this.first, this.size, this.number, this.sort,
    this.numberOfElements, this.empty});

  factory DepositTaxResponse.fromJson(Map<String, dynamic> json) =>
      _$DepositTaxResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DepositTaxResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class DepositTaxEntities {

  String? id;
  String? code;
  String? name;
  num? rate;
  bool? hasClientTinRequiredhasClientTinRequired;
  String? description;

  DepositTaxEntities({this.id, this.code, this.name, this.rate,
    this.hasClientTinRequiredhasClientTinRequired, this.description});

  factory DepositTaxEntities.fromJson(Map<String, dynamic> json) =>
      _$DepositTaxEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$DepositTaxEntitiesToJson(this);
}