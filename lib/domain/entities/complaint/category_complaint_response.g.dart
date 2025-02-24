// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_complaint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryComplaintResponse _$CategoryComplaintResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryComplaintResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) =>
              CategoryComplaintEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$CategoryComplaintResponseToJson(
        CategoryComplaintResponse instance) =>
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
