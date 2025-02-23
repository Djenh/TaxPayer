// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntities _$CategoryEntitiesFromJson(Map<String, dynamic> json) =>
    CategoryEntities(
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryEntitiesToJson(CategoryEntities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
    };
