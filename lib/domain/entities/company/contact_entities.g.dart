// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactEntities _$ContactEntitiesFromJson(Map<String, dynamic> json) =>
    ContactEntities(
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
    );

Map<String, dynamic> _$ContactEntitiesToJson(ContactEntities instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'websiteUrl': instance.websiteUrl,
    };
