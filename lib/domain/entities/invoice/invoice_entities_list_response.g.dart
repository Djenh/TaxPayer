// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_entities_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceEntitiesListResponse _$InvoiceEntitiesListResponseFromJson(
        Map<String, dynamic> json) =>
    InvoiceEntitiesListResponse(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => InvoiceResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$InvoiceEntitiesListResponseToJson(
        InvoiceEntitiesListResponse instance) =>
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
