class AddProductDto {

  String name;
  String? officalProductNo;
  String categoryCode;
  String productType;
  String? unitOfMeasurementCode;
  String companyTin;
  String posCode;
  int? amount;
  String? taxGroupCode;
  int? taxSpecific;

  AddProductDto({required this.name, this.officalProductNo,
    required this.categoryCode, required this.productType,
    this.unitOfMeasurementCode,required this.companyTin,
    required this.posCode, this.amount, this.taxSpecific, this.taxGroupCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'categoryCode': categoryCode,
      'productType': productType,
      'companyTin': companyTin,
      'posCode': posCode,
    };

    if(officalProductNo != null){
      data["officalProductNo"] = officalProductNo;
    }

    if(unitOfMeasurementCode != null){
      data["unitOfMeasurementCode"] = unitOfMeasurementCode;
    }

    if(amount != null){
      data["amount"] = amount;
    }

    if(taxSpecific != null){
      data["taxSpecific"] = taxSpecific;
    }

    if(taxGroupCode != null){
      data["taxGroupCode"] = taxGroupCode;
    }

    return data;
  }

  factory AddProductDto.fromJson(Map<String, dynamic> json) {
    return AddProductDto(
      name: json['name'],
      officalProductNo: json['officalProductNo'],
      categoryCode: json['categoryCode'],
      productType: json['productType'],
      unitOfMeasurementCode: json['unitOfMeasurementCode'],
      companyTin: json['companyTin'],
      posCode: json['posCode'],
      amount: json['amount'],
      taxSpecific: json['taxSpecific'],
      taxGroupCode: json['taxGroupCode'],
    );
  }
}