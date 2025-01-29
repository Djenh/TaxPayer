class PricingDto {

  int amount;
  String? productCode;
  String taxGroupCode;
  int taxSpecific;
  String priceDefinitionMode;



  PricingDto({required this.amount, this.productCode, required this.taxGroupCode,
    required this.taxSpecific, required this.priceDefinitionMode});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'amount': amount,
      'taxGroupCode': taxGroupCode,
      'taxSpecific': taxSpecific,
      'priceDefinitionMode': priceDefinitionMode
    };

    if(productCode != null){
      data["productCode"] = productCode;
    }

    return data;
  }

  factory PricingDto.fromJson(Map<String, dynamic> json) {
    return PricingDto(
        amount: json['amount'],
        productCode: json['productCode'],
        taxGroupCode: json['taxGroupCode'],
        taxSpecific: json['taxSpecific'],
        priceDefinitionMode: json['priceDefinitionMode']
    );
  }

}