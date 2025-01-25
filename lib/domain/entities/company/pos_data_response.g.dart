// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosDataResponse _$PosDataResponseFromJson(Map<String, dynamic> json) =>
    PosDataResponse(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : AddressEntities.fromJson(json['address'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : ContactEntities.fromJson(json['contact'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : CompanyTinResponse.fromJson(
              json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosDataResponseToJson(PosDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'address': instance.address?.toJson(),
      'contact': instance.contact?.toJson(),
      'company': instance.company?.toJson(),
    };
