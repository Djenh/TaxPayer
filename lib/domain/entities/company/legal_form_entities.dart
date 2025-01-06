import 'package:json_annotation/json_annotation.dart';


part 'legal_form_entities.g.dart';

@JsonSerializable(explicitToJson: true)
class LegalFormEntities {

  String? id;
  String? code;
  String? name;


  LegalFormEntities({this.id, this.code, this.name});

  factory LegalFormEntities.fromJson(Map<String, dynamic> json) =>
      _$LegalFormEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$LegalFormEntitiesToJson(this);
}