// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complainant_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplainantEntities _$ComplainantEntitiesFromJson(Map<String, dynamic> json) =>
    ComplainantEntities(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$ComplainantEntitiesToJson(
        ComplainantEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
