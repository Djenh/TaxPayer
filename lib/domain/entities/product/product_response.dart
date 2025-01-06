import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'product_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductResponse {

  String? id;
  String? code;
  String? name;
  CategoriesEntities? category;
  String? productType;
  String? companyTin;


  ProductResponse({this.id, this.code, this.name, this.category,
    this.productType, this.companyTin});

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