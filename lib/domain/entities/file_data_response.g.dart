// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDataResponse _$FileDataResponseFromJson(Map<String, dynamic> json) =>
    FileDataResponse(
      status: json['status'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      info: json['info'] as String?,
      reference: json['reference'] as String?,
      id: (json['id'] as num?)?.toInt(),
      path: json['path'] as String?,
      data: json['data'] == null
          ? null
          : FileEntities.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileDataResponseToJson(FileDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'info': instance.info,
      'reference': instance.reference,
      'id': instance.id,
      'path': instance.path,
      'data': instance.data?.toJson(),
    };

FileEntities _$FileEntitiesFromJson(Map<String, dynamic> json) => FileEntities(
      name: json['name'] as String?,
      path: json['path'] as String?,
      type: json['type'] as String?,
      contentType: json['contentType'] as String?,
      url: json['url'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$FileEntitiesToJson(FileEntities instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'type': instance.type,
      'contentType': instance.contentType,
      'url': instance.url,
      'version': instance.version,
    };
