import 'package:json_annotation/json_annotation.dart';

part 'lottery_participation_response.g.dart';


@JsonSerializable(explicitToJson: true)
class LotteryParticipationResponse {

  String? status;
  InvoiceEntities? invoice;

  LotteryParticipationResponse({this.status, this.invoice});

  factory LotteryParticipationResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryParticipationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LotteryParticipationResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class InvoiceEntities {

  String? uuid;
  String? signature;
  int? issuedDateTimestamp;
  String? phone;
  String? email;
  int? totalInvoice;


  InvoiceEntities({this.uuid, this.signature, this.issuedDateTimestamp,
    this.phone, this.email, this.totalInvoice});

  factory InvoiceEntities.fromJson(Map<String, dynamic> json) =>
      _$InvoiceEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceEntitiesToJson(this);
}