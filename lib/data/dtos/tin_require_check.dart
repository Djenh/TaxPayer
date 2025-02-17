class TinRequireCheckDto {
  String? clientCode;
  String? securityTaxCode;

  TinRequireCheckDto({
    this.clientCode,
    this.securityTaxCode,
  });

  factory TinRequireCheckDto.fromJson(Map<String, dynamic> json) => TinRequireCheckDto(
    clientCode: json["clientCode"],
    securityTaxCode: json["securityTaxCode"],
  );

  Map<String, dynamic> toJson() => {
    "clientCode": clientCode,
    "securityTaxCode": securityTaxCode,
  };
}