import 'package:json_annotation/json_annotation.dart';


part 'categories_entities.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoriesEntities {

  String? id;
  String? code;
  String? name;


  CategoriesEntities({this.id, this.code, this.name});

  factory CategoriesEntities.fromJson(Map<String, dynamic> json) =>
      _$CategoriesEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesEntitiesToJson(this);
}