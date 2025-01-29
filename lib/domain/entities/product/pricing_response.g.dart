// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingResponse _$PricingResponseFromJson(Map<String, dynamic> json) =>
    PricingResponse(
      id: json['id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      taxGroup: json['taxGroup'] == null
          ? null
          : TaxGroupEntities.fromJson(json['taxGroup'] as Map<String, dynamic>),
      taxSpecific: (json['taxSpecific'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      priceDefinitionMode: json['priceDefinitionMode'] as String?,
      subTotal: json['subTotal'] == null
          ? null
          : SubTotalPriceProd.fromJson(
              json['subTotal'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$PricingResponseToJson(PricingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'taxGroup': instance.taxGroup?.toJson(),
      'taxSpecific': instance.taxSpecific,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'priceDefinitionMode': instance.priceDefinitionMode,
      'subTotal': instance.subTotal?.toJson(),
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

SubTotalPriceProd _$SubTotalPriceProdFromJson(Map<String, dynamic> json) =>
    SubTotalPriceProd(
      ttc: json['ttc'] as num?,
      ht: json['ht'] as num?,
      baseTaxable: json['baseTaxable'] as num?,
      tax: json['tax'] as num?,
      specificTax: json['specificTax'] as num?,
    );

Map<String, dynamic> _$SubTotalPriceProdToJson(SubTotalPriceProd instance) =>
    <String, dynamic>{
      'ttc': instance.ttc,
      'ht': instance.ht,
      'baseTaxable': instance.baseTaxable,
      'tax': instance.tax,
      'specificTax': instance.specificTax,
    };
