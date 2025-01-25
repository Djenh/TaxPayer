import 'package:invoice_app/domain/entities/company/sector_entities.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'localities_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalitiesListResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<LocalitiesEntities>? content;
  int? number;
  List<String>? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? empty;


  LocalitiesListResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number, this.sort,
    this.numberOfElements, this.pageable, this.empty});

  factory LocalitiesListResponse.fromJson(Map<String, dynamic> json) =>
      _$LocalitiesListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocalitiesListResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class LocalitiesEntities {

  String? code;
  String? name;
  ParentEntities? parent;


  LocalitiesEntities({this.code, this.name, this.parent});

  factory LocalitiesEntities.fromJson(Map<String, dynamic> json) =>
      _$LocalitiesEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$LocalitiesEntitiesToJson(this);
}