// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxGroupResponse _$TaxGroupResponseFromJson(Map<String, dynamic> json) =>
    TaxGroupResponse(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => TaxGroupEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool?,
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$TaxGroupResponseToJson(TaxGroupResponse instance) =>
    <String, dynamic>{
      'content': instance.content?.map((e) => e.toJson()).toList(),
      'pageable': instance.pageable?.toJson(),
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'first': instance.first,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

TaxGroupEntities _$TaxGroupEntitiesFromJson(Map<String, dynamic> json) =>
    TaxGroupEntities(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TaxGroupEntitiesToJson(TaxGroupEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'rate': instance.rate,
      'description': instance.description,
    };
