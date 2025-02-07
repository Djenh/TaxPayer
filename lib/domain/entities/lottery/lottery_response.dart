import 'package:json_annotation/json_annotation.dart';


part 'lottery_data_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LotteryDataResponse {

  String uuid;
  String signature;
  int issuedDateTimestamp;
  String participant;
  String phone;
  String? email;
  int totalInvoice;

  LotteryDataResponse({this.uuid, this.signature, this.issuedDateTimestamp,
    this.participant, this.phone, this.email, this.totalInvoice});

  factory LotteryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LotteryDataResponseToJson(this);
}