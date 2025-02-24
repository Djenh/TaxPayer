// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintDataResponse _$ComplaintDataResponseFromJson(
        Map<String, dynamic> json) =>
    ComplaintDataResponse(
      code: json['code'] as String?,
      subject: json['subject'] as String?,
      content: json['content'] as String?,
      concernTin: json['concernTin'] as String?,
      concernName: json['concernName'] as String?,
      concernInvoiceSignature: json['concernInvoiceSignature'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      complainant: json['complainant'] == null
          ? null
          : ComplainantEntities.fromJson(
              json['complainant'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryComplaintEntities.fromJson(
              json['category'] as Map<String, dynamic>),
      upload: json['upload'] as String?,
      officer: json['officer'] == null
          ? null
          : OfficerEntities.fromJson(json['officer'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ComplaintDataResponseToJson(
        ComplaintDataResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'subject': instance.subject,
      'content': instance.content,
      'concernTin': instance.concernTin,
      'concernName': instance.concernName,
      'concernInvoiceSignature': instance.concernInvoiceSignature,
      'status': instance.status,
      'priority': instance.priority,
      'complainant': instance.complainant?.toJson(),
      'category': instance.category?.toJson(),
      'upload': instance.upload,
      'officer': instance.officer?.toJson(),
      'createdAt': instance.createdAt,
    };
