import 'package:invoice_app/data/dtos/pricing_dto.dart';

class AddProductDto {

  String name;
  String? officalProductNo;
  String categoryCode;
  String productType;
  String? unitOfMeasurementCode;
  String companyTin;
  String posCode;
  PricingDto? price;

  AddProductDto({required this.name, this.officalProductNo,
    required this.categoryCode, required this.productType,
    this.unitOfMeasurementCode,required this.companyTin,
    required this.posCode, this.price});

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

    if(price != null){
      data["price"] = price!.toJson();
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
      price: json['price']
    );
  }
}