import 'package:invoice_app/domain/entities/sort_entities.dart';
import 'package:json_annotation/json_annotation.dart';


part 'pageable.g.dart';

@JsonSerializable(explicitToJson: true)
class Pageable {

  int? pageNumber;
  int? pageSize;
  List<String>? sort;
  int? offset;
  bool? paged;
  bool? unpaged;


  Pageable({this.pageNumber, this.pageSize, this.sort, this.offset, this.paged,
    this.unpaged});

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}


@JsonSerializable(explicitToJson: true)
class Pageable1 {

  int? pageNumber;
  int? pageSize;
  SortEntities? sort;
  int? offset;
  bool? paged;
  bool? unpaged;


  Pageable1({this.pageNumber, this.pageSize, this.sort, this.offset, this.paged,
    this.unpaged});

  factory Pageable1.fromJson(Map<String, dynamic> json) =>
      _$Pageable1FromJson(json);

  Map<String, dynamic> toJson() => _$Pageable1ToJson(this);
}