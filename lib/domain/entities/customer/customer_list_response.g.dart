// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerListResponse _$CustomerListResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerListResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => CustomerEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$CustomerListResponseToJson(
        CustomerListResponse instance) =>
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

CustomerEntities _$CustomerEntitiesFromJson(Map<String, dynamic> json) =>
    CustomerEntities(
      id: json['id'] as String?,
      code: json['code'] as String?,
      tin: json['tin'] as String?,
      name: json['name'] as String?,
      typeClient: json['typeClient'] as String?,
      category: json['category'] == null
          ? null
          : CategoriesEntities.fromJson(
              json['category'] as Map<String, dynamic>),
      ownerTin: json['ownerTin'] as String?,
      contact: json['contact'] == null
          ? null
          : ContactEntities.fromJson(json['contact'] as Map<String, dynamic>),
      invoicingAddress: json['invoicingAddress'] == null
          ? null
          : AddressEntities.fromJson(
              json['invoicingAddress'] as Map<String, dynamic>),
      status: json['status'] as String?,
      dropped: json['dropped'] as bool?,
    );

Map<String, dynamic> _$CustomerEntitiesToJson(CustomerEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'tin': instance.tin,
      'name': instance.name,
      'typeClient': instance.typeClient,
      'category': instance.category?.toJson(),
      'ownerTin': instance.ownerTin,
      'contact': instance.contact?.toJson(),
      'invoicingAddress': instance.invoicingAddress?.toJson(),
      'status': instance.status,
      'dropped': instance.dropped,
    };
