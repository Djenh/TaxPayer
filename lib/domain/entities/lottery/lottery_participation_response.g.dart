// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_participation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LotteryParticipationResponse _$LotteryParticipationResponseFromJson(
        Map<String, dynamic> json) =>
    LotteryParticipationResponse(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map(
              (e) => ParticipationEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$LotteryParticipationResponseToJson(
        LotteryParticipationResponse instance) =>
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

ParticipationEntities _$ParticipationEntitiesFromJson(
        Map<String, dynamic> json) =>
    ParticipationEntities(
      invoice: json['invoice'] == null
          ? null
          : InvoiceEntities.fromJson(json['invoice'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ParticipationEntitiesToJson(
        ParticipationEntities instance) =>
    <String, dynamic>{
      'invoice': instance.invoice?.toJson(),
      'status': instance.status,
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
