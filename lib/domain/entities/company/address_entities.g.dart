// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressEntities _$AddressEntitiesFromJson(Map<String, dynamic> json) =>
    AddressEntities(
      locality: json['locality'] == null
          ? null
          : SectorEntities.fromJson(json['locality'] as Map<String, dynamic>),
      description: json['description'] as String?,
      gps: json['gps'] == null
          ? null
          : GpsEntities.fromJson(json['gps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressEntitiesToJson(AddressEntities instance) =>
    <String, dynamic>{
      'locality': instance.locality?.toJson(),
      'description': instance.description,
      'gps': instance.gps?.toJson(),
    };

GpsEntities _$GpsEntitiesFromJson(Map<String, dynamic> json) => GpsEntities(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GpsEntitiesToJson(GpsEntities instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
