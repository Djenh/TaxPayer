import 'package:json_annotation/json_annotation.dart';


part 'sort_entities.g.dart';

@JsonSerializable(explicitToJson: true)
class SortEntities {

  bool? empty;
  bool? sorted;
  bool? unsorted;

  SortEntities({this.empty, this.sorted, this.unsorted});

  factory SortEntities.fromJson(Map<String, dynamic> json) =>
      _$SortEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$SortEntitiesToJson(this);
}