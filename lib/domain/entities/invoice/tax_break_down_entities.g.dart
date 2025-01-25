// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_break_down_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxBreakDownEntities _$TaxBreakDownEntitiesFromJson(
        Map<String, dynamic> json) =>
    TaxBreakDownEntities(
      taxGroup: json['taxGroup'] == null
          ? null
          : TaxGroupEntities.fromJson(json['taxGroup'] as Map<String, dynamic>),
      tax: json['tax'] as num?,
      taxableBase: json['taxableBase'] as num?,
      total: json['total'] as num?,
    );

Map<String, dynamic> _$TaxBreakDownEntitiesToJson(
        TaxBreakDownEntities instance) =>
    <String, dynamic>{
      'taxGroup': instance.taxGroup?.toJson(),
      'tax': instance.tax,
      'taxableBase': instance.taxableBase,
      'total': instance.total,
    };
