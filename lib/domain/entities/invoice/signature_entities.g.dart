// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignatureEntities _$SignatureEntitiesFromJson(Map<String, dynamic> json) =>
    SignatureEntities(
      signature: json['signature'] as String?,
      length: (json['length'] as num?)?.toInt(),
      certifiedDate: json['certifiedDate'] as String?,
      tinPos: json['tinPos'] as String?,
      softwareCertificateNo: json['softwareCertificateNo'] as String?,
      qrCode: json['qrCode'] as String?,
      qrCodeBase64: json['qrCodeBase64'] as String?,
    );

Map<String, dynamic> _$SignatureEntitiesToJson(SignatureEntities instance) =>
    <String, dynamic>{
      'signature': instance.signature,
      'length': instance.length,
      'certifiedDate': instance.certifiedDate,
      'tinPos': instance.tinPos,
      'softwareCertificateNo': instance.softwareCertificateNo,
      'qrCode': instance.qrCode,
      'qrCodeBase64': instance.qrCodeBase64,
    };
