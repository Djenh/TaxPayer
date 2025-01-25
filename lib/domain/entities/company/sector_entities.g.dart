// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorEntities _$SectorEntitiesFromJson(Map<String, dynamic> json) =>
    SectorEntities(
      code: json['code'] as String?,
      name: json['name'] as String?,
      parent: json['parent'] == null
          ? null
          : ParentEntities.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SectorEntitiesToJson(SectorEntities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'parent': instance.parent?.toJson(),
    };

ParentEntities _$ParentEntitiesFromJson(Map<String, dynamic> json) =>
    ParentEntities(
      code: json['code'] as String?,
      name: json['name'] as String?,
      parent: json['parent'] as String?,
    );

Map<String, dynamic> _$ParentEntitiesToJson(ParentEntities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'parent': instance.parent,
    };
