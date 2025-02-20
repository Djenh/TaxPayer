import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';

part 'lottery_participation_response.g.dart';


@JsonSerializable(explicitToJson: true)
class LotteryParticipationResponse {

  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<ParticipationEntities>? content;
  int? number;
  // List<String>? sort;
  int? numberOfElements;
  // Pageable? pageable;
  bool? empty;

  LotteryParticipationResponse({this.totalPages, this.totalElements, this.first,
    this.last, this.size, this.content, this.number, //this.sort,
    this.numberOfElements, //this.pageable,
    this.empty});

  factory LotteryParticipationResponse.fromJson(Map<String, dynamic> json) =>
      _$LotteryParticipationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LotteryParticipationResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class ParticipationEntities {

  InvoiceEntities? invoice;
  String? status;


  ParticipationEntities({this.invoice, this.status});

  factory ParticipationEntities.fromJson(Map<String, dynamic> json) =>
      _$ParticipationEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipationEntitiesToJson(this);
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