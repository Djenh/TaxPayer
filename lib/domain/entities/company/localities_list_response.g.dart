// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localities_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalitiesListResponse _$LocalitiesListResponseFromJson(
        Map<String, dynamic> json) =>
    LocalitiesListResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => LocalitiesEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$LocalitiesListResponseToJson(
        LocalitiesListResponse instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'first': instance.first,
      'last': instance.last,
      'size': instance.size,
      'content': instance.content?.map((e) => e.toJson()).toList(),
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'pageable': instance.pageable?.toJson(),
      'empty': instance.empty,
    };

LocalitiesEntities _$LocalitiesEntitiesFromJson(Map<String, dynamic> json) =>
    LocalitiesEntities(
      code: json['code'] as String?,
      name: json['name'] as String?,
      parent: json['parent'] == null
          ? null
          : ParentEntities.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocalitiesEntitiesToJson(LocalitiesEntities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'parent': instance.parent?.toJson(),
    };
