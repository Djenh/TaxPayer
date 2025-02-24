import 'package:json_annotation/json_annotation.dart';

import 'category_complaint_entities.dart';
import 'complainant_entities.dart';
import 'officer_entities.dart';

part 'complaint_data_response.g.dart';


@JsonSerializable(explicitToJson: true)
class ComplaintDataResponse {

  String? code;
  String? subject;
  String? content;
  String? concernTin;
  String? concernName;
  String? concernInvoiceSignature;
  String? status;
  String? priority;
  ComplainantEntities? complainant;
  CategoryComplaintEntities? category;
  String? upload;
  OfficerEntities? officer;
  String? createdAt;

  ComplaintDataResponse({this.code, this.subject, this.content, this.concernTin,
    this.concernName, this.concernInvoiceSignature, this.status, this.priority,
    this.complainant, this.category, this.upload, this.officer, this.createdAt});

  factory ComplaintDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintDataResponseToJson(this);
}