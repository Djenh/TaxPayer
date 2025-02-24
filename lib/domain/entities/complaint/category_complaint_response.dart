import 'package:json_annotation/json_annotation.dart';

import 'category_complaint_entities.dart';


part 'category_complaint_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryComplaintResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<CategoryComplaintEntities>? content;
  int? number;
  // List<String>? sort;
  int? numberOfElements;
  // Pageable? pageable;
  bool? empty;


  CategoryComplaintResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number,
    this.numberOfElements, this.empty});

  factory CategoryComplaintResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryComplaintResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryComplaintResponseToJson(this);
}