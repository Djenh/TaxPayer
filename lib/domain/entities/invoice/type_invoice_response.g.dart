// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeInvoiceResponse _$TypeInvoiceResponseFromJson(Map<String, dynamic> json) =>
    TypeInvoiceResponse(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => TypeInvoiceEntities.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$TypeInvoiceResponseToJson(
        TypeInvoiceResponse instance) =>
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

TypeInvoiceEntities _$TypeInvoiceEntitiesFromJson(Map<String, dynamic> json) =>
    TypeInvoiceEntities(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      reimbursement: json['reimbursement'] as String?,
    );

Map<String, dynamic> _$TypeInvoiceEntitiesToJson(
        TypeInvoiceEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'reimbursement': instance.reimbursement,
    };
