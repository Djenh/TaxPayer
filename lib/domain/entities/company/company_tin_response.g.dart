// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_tin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyTinResponse _$CompanyTinResponseFromJson(Map<String, dynamic> json) =>
    CompanyTinResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      tin: json['tin'] as String?,
      tradeNo: json['tradeNo'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      legalForm: json['legalForm'] == null
          ? null
          : LegalFormEntities.fromJson(
              json['legalForm'] as Map<String, dynamic>),
      sectors: (json['sectors'] as List<dynamic>?)
          ?.map((e) => LegalFormEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      websiteUrl: json['websiteUrl'] as String?,
      status: json['status'] as String?,
      totalPos: (json['totalPos'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompanyTinResponseToJson(CompanyTinResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tin': instance.tin,
      'tradeNo': instance.tradeNo,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'legalForm': instance.legalForm?.toJson(),
      'sectors': instance.sectors?.map((e) => e.toJson()).toList(),
      'websiteUrl': instance.websiteUrl,
      'status': instance.status,
      'totalPos': instance.totalPos,
    };
