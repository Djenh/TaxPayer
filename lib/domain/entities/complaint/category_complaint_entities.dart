import 'package:json_annotation/json_annotation.dart';

part 'category_complaint_entities.g.dart';


@JsonSerializable(explicitToJson: true)
class CategoryComplaintEntities {

  String? code;
  String? name;
  String? description;

  CategoryComplaintEntities({this.code, this.name, this.description});

  factory CategoryComplaintEntities.fromJson(Map<String, dynamic> json) =>
      _$CategoryComplaintEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryComplaintEntitiesToJson(this);
}