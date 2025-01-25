// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_m_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitMListResponse _$UnitMListResponseFromJson(Map<String, dynamic> json) =>
    UnitMListResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => UnitMEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$UnitMListResponseToJson(UnitMListResponse instance) =>
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

UnitMEntities _$UnitMEntitiesFromJson(Map<String, dynamic> json) =>
    UnitMEntities(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UnitMEntitiesToJson(UnitMEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
    };
