import 'package:json_annotation/json_annotation.dart';

part 'officer_entities.g.dart';


@JsonSerializable(explicitToJson: true)
class OfficerEntities {

  String? officierId;
  String? name;

  OfficerEntities({this.officierId, this.name});

  factory OfficerEntities.fromJson(Map<String, dynamic> json) =>
      _$OfficerEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$OfficerEntitiesToJson(this);
}