// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LotteryDataResponse _$LotteryDataResponseFromJson(Map<String, dynamic> json) =>
    LotteryDataResponse(
      uuid: json['uuid'] as String?,
      signature: json['signature'] as String?,
      issuedDateTimestamp: (json['issuedDateTimestamp'] as num?)?.toInt(),
      participant: json['participant'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      totalInvoice: (json['totalInvoice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LotteryDataResponseToJson(
        LotteryDataResponse instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'signature': instance.signature,
      'issuedDateTimestamp': instance.issuedDateTimestamp,
      'participant': instance.participant,
      'phone': instance.phone,
      'email': instance.email,
      'totalInvoice': instance.totalInvoice,
    };
