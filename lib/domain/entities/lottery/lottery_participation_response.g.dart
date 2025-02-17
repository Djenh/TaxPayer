// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_participation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LotteryParticipationResponse _$LotteryParticipationResponseFromJson(
        Map<String, dynamic> json) =>
    LotteryParticipationResponse(
      status: json['status'] as String?,
      invoice: json['invoice'] == null
          ? null
          : InvoiceEntities.fromJson(json['invoice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LotteryParticipationResponseToJson(
        LotteryParticipationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'invoice': instance.invoice?.toJson(),
    };

InvoiceEntities _$InvoiceEntitiesFromJson(Map<String, dynamic> json) =>
    InvoiceEntities(
      uuid: json['uuid'] as String?,
      signature: json['signature'] as String?,
      issuedDateTimestamp: (json['issuedDateTimestamp'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      totalInvoice: (json['totalInvoice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InvoiceEntitiesToJson(InvoiceEntities instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'signature': instance.signature,
      'issuedDateTimestamp': instance.issuedDateTimestamp,
      'phone': instance.phone,
      'email': instance.email,
      'totalInvoice': instance.totalInvoice,
    };
