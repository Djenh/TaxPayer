// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_tax_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositTaxResponse _$DepositTaxResponseFromJson(Map<String, dynamic> json) =>
    DepositTaxResponse(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => DepositTaxEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable1.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool?,
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : SortEntities.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$DepositTaxResponseToJson(DepositTaxResponse instance) =>
    <String, dynamic>{
      'content': instance.content?.map((e) => e.toJson()).toList(),
      'pageable': instance.pageable?.toJson(),
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'first': instance.first,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort?.toJson(),
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

DepositTaxEntities _$DepositTaxEntitiesFromJson(Map<String, dynamic> json) =>
    DepositTaxEntities(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      rate: json['rate'] as num?,
      hasClientTinRequiredhasClientTinRequired:
          json['hasClientTinRequiredhasClientTinRequired'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DepositTaxEntitiesToJson(DepositTaxEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'rate': instance.rate,
      'hasClientTinRequiredhasClientTinRequired':
          instance.hasClientTinRequiredhasClientTinRequired,
      'description': instance.description,
    };
