// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingResponse _$PricingResponseFromJson(Map<String, dynamic> json) =>
    PricingResponse(
      id: json['id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      productCode: json['productCode'] as String?,
      taxGroup: json['taxGroup'] == null
          ? null
          : TaxGroupEntities.fromJson(json['taxGroup'] as Map<String, dynamic>),
      taxSpecific: (json['taxSpecific'] as num?)?.toInt(),
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
      priceDefinitionMode: json['priceDefinitionMode'] as String?,
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$PricingResponseToJson(PricingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'productCode': instance.productCode,
      'taxGroup': instance.taxGroup?.toJson(),
      'taxSpecific': instance.taxSpecific,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'priceDefinitionMode': instance.priceDefinitionMode,
      'enabled': instance.enabled,
    };

PricingListResponse _$PricingListResponseFromJson(Map<String, dynamic> json) =>
    PricingListResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => PricingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$PricingListResponseToJson(
        PricingListResponse instance) =>
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
