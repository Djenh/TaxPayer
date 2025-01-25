import 'package:json_annotation/json_annotation.dart';


part 'signature_entities.g.dart';


@JsonSerializable(explicitToJson: true)
class SignatureEntities {

  String? signature;
  int? length;
  String? certifiedDate;
  String? tinPos;
  String? softwareCertificateNo;
  String? qrCode;
  String? qrCodeBase64;


  SignatureEntities({this.signature, this.length, this.certifiedDate,
    this.tinPos, this.softwareCertificateNo, this.qrCode, this.qrCodeBase64});

  factory SignatureEntities.fromJson(Map<String, dynamic> json) =>
      _$SignatureEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureEntitiesToJson(this);
}