import 'package:json_annotation/json_annotation.dart';

part 'complainant_entities.g.dart';


@JsonSerializable(explicitToJson: true)
class ComplainantEntities {

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  ComplainantEntities({this.id, this.firstName, this.lastName, this.email,
        this.phoneNumber});

  factory ComplainantEntities.fromJson(Map<String, dynamic> json) =>
      _$ComplainantEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainantEntitiesToJson(this);
}