class AddProductDto {

  String code;
  String name;
  String categoryCode;
  String productType;
  String companyTin;
  String? posId;

  AddProductDto({required this.code, required this.name,
    required this.categoryCode, required this.productType,
    required this.companyTin, required this.posId });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'code': code,
      'name': name,
      'categoryCode': categoryCode,
      'productType': productType,
      'companyTin': companyTin,
      'posId': posId,
    };
    return data;
  }

  factory AddProductDto.fromJson(Map<String, dynamic> json) {
    return AddProductDto(
      code: json['code'],
      name: json['name'],
      categoryCode: json['categoryCode'],
      productType: json['productType'],
      companyTin: json['companyTin'],
      posId: json['posId'],
    );
  }
}