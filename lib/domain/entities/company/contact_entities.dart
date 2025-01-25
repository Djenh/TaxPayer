import 'package:json_annotation/json_annotation.dart';


part 'contact_entities.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactEntities {

  String? phoneNumber;
  String? email;
  String? websiteUrl;


  ContactEntities({this.phoneNumber, this.email, this.websiteUrl});

  factory ContactEntities.fromJson(Map<String, dynamic> json) =>
      _$ContactEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ContactEntitiesToJson(this);
}