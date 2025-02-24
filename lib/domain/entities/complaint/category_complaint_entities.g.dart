// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_complaint_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryComplaintEntities _$CategoryComplaintEntitiesFromJson(
        Map<String, dynamic> json) =>
    CategoryComplaintEntities(
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryComplaintEntitiesToJson(
        CategoryComplaintEntities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
    };
