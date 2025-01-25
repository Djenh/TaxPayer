import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'unit_m_list_response.g.dart';


@JsonSerializable(explicitToJson: true)
class UnitMListResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<UnitMEntities>? content;
  int? number;
  List<String>? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? empty;


  UnitMListResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number, this.sort,
    this.numberOfElements, this.pageable, this.empty});

  factory UnitMListResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitMListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitMListResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class UnitMEntities {

  String? id;
  String? code;
  String? name;
  String? description;


  UnitMEntities({this.id, this.code, this.name, this.description});

  factory UnitMEntities.fromJson(Map<String, dynamic> json) =>
      _$UnitMEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$UnitMEntitiesToJson(this);
}