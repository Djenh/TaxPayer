import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'categories_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoriesListResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<CategoriesEntities>? content;
  int? number;
  List<String>? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? empty;


  CategoriesListResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number, this.sort,
    this.numberOfElements, this.pageable, this.empty});

  factory CategoriesListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesListResponseToJson(this);
}