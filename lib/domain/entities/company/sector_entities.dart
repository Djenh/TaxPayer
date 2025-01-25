import 'package:json_annotation/json_annotation.dart';


part 'sector_entities.g.dart';

@JsonSerializable(explicitToJson: true)
class SectorEntities {

  String? code;
  String? name;
  ParentEntities? parent;


  SectorEntities({this.code, this.name, this.parent});

  factory SectorEntities.fromJson(Map<String, dynamic> json) =>
      _$SectorEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$SectorEntitiesToJson(this);
}


@JsonSerializable(explicitToJson: true)
class ParentEntities {

  String? code;
  String? name;
  String? parent;


  ParentEntities({this.code, this.name, this.parent});

  factory ParentEntities.fromJson(Map<String, dynamic> json) =>
      _$ParentEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ParentEntitiesToJson(this);
}