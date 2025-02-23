import 'package:json_annotation/json_annotation.dart';

part 'category_entities.g.dart';


@JsonSerializable(explicitToJson: true)
class CategoryEntities {

  String? code;
  String? name;
  String? description;

  CategoryEntities({this.code, this.name, this.description});

  factory CategoryEntities.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntitiesToJson(this);
}