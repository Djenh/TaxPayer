import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'product_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductResponse {

  String? id;
  String? code;
  String? name;
  String? officialProductNo;
  PricingResponse? price;
  CategoriesEntities? category;
  String? productType;
  String? companyTin;
  String? posCode;


  ProductResponse({this.id, this.code, this.name, this.officialProductNo,
    this.price, this.category, this.productType, this.companyTin, this.posCode});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}



@JsonSerializable(explicitToJson: true)
class ProductListResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<ProductResponse>? content;
  int? number;
  List<String>? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? empty;


  ProductListResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number, this.sort,
    this.numberOfElements, this.pageable, this.empty});

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);
}