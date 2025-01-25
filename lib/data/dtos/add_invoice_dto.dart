class ItemInvoiceDto {

  String? comment;
  int quantity;
  String productCode;

  ItemInvoiceDto({this.comment, required this.quantity,
    required this.productCode});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'quantity': quantity,
      'productCode': productCode
    };

    if(comment != null){
      data["comment"] = comment;
    }

    return data;
  }

  factory ItemInvoiceDto.fromJson(Map<String, dynamic> json) {
    return ItemInvoiceDto(
        comment: json['comment'],
        quantity: json['quantity'],
        productCode: json['productCode']
    );
  }
}

class AddInvoiceDto {
  String clientCode;
  String typeInvoiceCode;
  String tin;
  String posCode;
  String securityTaxCode;
  String? comment;
  List<ItemInvoiceDto> items;

  AddInvoiceDto({required this.clientCode, required this.typeInvoiceCode,
      required this.tin, required this.posCode, required this.securityTaxCode,
     this.comment, required this.items});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'clientCode': clientCode,
      'typeInvoiceCode': typeInvoiceCode,
      'tin': tin,
      'posCode': posCode,
      'securityTaxCode': securityTaxCode,
      'items': items
    };


    if(comment != null){
      data["comment"] = comment;
    }


    return data;
  }

  factory AddInvoiceDto.fromJson(Map<String, dynamic> json) {
    return AddInvoiceDto(
        clientCode: json['clientCode'],
        typeInvoiceCode: json['typeInvoiceCode'],
        tin: json['tin'],
        posCode: json['posCode'],
        securityTaxCode: json['securityTaxCode'],
        comment: json['comment'],
        items: json['items']
    );
  }
}

