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