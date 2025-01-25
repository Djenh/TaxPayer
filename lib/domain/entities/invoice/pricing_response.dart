import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/pageable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'pricing_response.g.dart';


@JsonSerializable(explicitToJson: true)
class PricingResponse {

  String? id;
  int? amount;
  String? productCode;
  TaxGroupEntities? taxGroup;
  int? taxSpecific;
  double? createdAt;
  double? updatedAt;
  String? priceDefinitionMode;
  bool? enabled;

  PricingResponse({this.id, this.amount, this.productCode, this.taxGroup,
    this.taxSpecific, this.createdAt, this.updatedAt,
    this.priceDefinitionMode, this.enabled});

  factory PricingResponse.fromJson(Map<String, dynamic> json) =>
      _$PricingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PricingResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class PricingListResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<PricingResponse>? content;
  int? number;
  List<String>? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? empty;


  PricingListResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number, this.sort,
    this.numberOfElements, this.pageable, this.empty});

  factory PricingListResponse.fromJson(Map<String, dynamic> json) =>
      _$PricingListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PricingListResponseToJson(this);
}