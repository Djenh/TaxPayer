class AddItemDto {

  String taxGroupCode;
  String typeProductCode;
  String? comment;
  int quantity;
  int price;
  String externalProductNo;
  String? name;
  String priceDefinitionMode;
  int? taxSpecific;

  AddItemDto({required this.taxGroupCode, required this.typeProductCode,
    this.comment, required this.quantity, required this.price,
    required this.externalProductNo, this.name,
    required this.priceDefinitionMode, this.taxSpecific});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'taxGroupCode': taxGroupCode,
      'typeProductCode': typeProductCode,
      'quantity': quantity,
      'price': price,
      'externalProductNo': externalProductNo,
      'priceDefinitionMode': priceDefinitionMode
    };

    if(comment != null){
      data["comment"] = comment;
    }

    if(name != null){
      data["name"] = name;
    }

    if(taxSpecific != null){
      data["taxSpecific"] = taxSpecific;
    }

    return data;
  }

  factory AddItemDto.fromJson(Map<String, dynamic> json) {
    return AddItemDto(
      taxGroupCode: json['taxGroupCode'],
      typeProductCode: json['typeProductCode'],
      comment: json['comment'],
      quantity: json['quantity'],
      price: json['price'],
      externalProductNo: json['externalProductNo'],
      name: json['name'],
      priceDefinitionMode: json['priceDefinitionMode'],
      taxSpecific: json['taxSpecific'],
    );
  }

}