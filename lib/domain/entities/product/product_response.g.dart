// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      officialProductNo: json['officialProductNo'] as String?,
      price: json['price'] == null
          ? null
          : PricingResponse.fromJson(json['price'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoriesEntities.fromJson(
              json['category'] as Map<String, dynamic>),
      productType: json['productType'] as String?,
      companyTin: json['companyTin'] as String?,
      posCode: json['posCode'] as String?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'officialProductNo': instance.officialProductNo,
      'price': instance.price?.toJson(),
      'category': instance.category?.toJson(),
      'productType': instance.productType,
      'companyTin': instance.companyTin,
      'posCode': instance.posCode,
    };

ProductListResponse _$ProductListResponseFromJson(Map<String, dynamic> json) =>
    ProductListResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$ProductListResponseToJson(
        ProductListResponse instance) =>
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
