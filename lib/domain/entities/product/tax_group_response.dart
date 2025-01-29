import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'tax_group_response.g.dart';


@JsonSerializable(explicitToJson: true)
class TaxGroupResponse {

  List<TaxGroupEntities>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  bool? first;
  int? size;
  int? number;
  List<String>? sort;
  int? numberOfElements;
  bool? empty;


  TaxGroupResponse({this.content, this.pageable, this.last, this.totalPages,
    this.totalElements, this.first, this.size, this.number, this.sort,
    this.numberOfElements, this.empty});

  factory TaxGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$TaxGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaxGroupResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class TaxGroupEntities {

  String? id;
  String? code;
  String? name;
  num? rate;


  TaxGroupEntities({this.id, this.code, this.name, this.rate});

  factory TaxGroupEntities.fromJson(Map<String, dynamic> json) =>
      _$TaxGroupEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$TaxGroupEntitiesToJson(this);
}