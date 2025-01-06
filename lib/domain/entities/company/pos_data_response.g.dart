// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosDataResponse _$PosDataResponseFromJson(Map<String, dynamic> json) =>
    PosDataResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      companyTin: json['companyTin'] as String?,
    );

Map<String, dynamic> _$PosDataResponseToJson(PosDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'companyTin': instance.companyTin,
    };
