// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintListResponse _$ComplaintListResponseFromJson(
        Map<String, dynamic> json) =>
    ComplaintListResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map(
              (e) => ComplaintDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$ComplaintListResponseToJson(
        ComplaintListResponse instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'first': instance.first,
      'last': instance.last,
      'size': instance.size,
      'content': instance.content?.map((e) => e.toJson()).toList(),
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };
