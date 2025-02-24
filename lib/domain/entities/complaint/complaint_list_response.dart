import 'package:json_annotation/json_annotation.dart';

import 'complaint_data_response.dart';

part 'complaint_list_response.g.dart';


@JsonSerializable(explicitToJson: true)
class ComplaintListResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<ComplaintDataResponse>? content;
  int? number;
  int? numberOfElements;
  bool? empty;

  ComplaintListResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number,
    this.numberOfElements, this.empty});

  factory ComplaintListResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplaintListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintListResponseToJson(this);
}

