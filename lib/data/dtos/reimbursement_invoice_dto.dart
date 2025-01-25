import 'package:invoice_app/data/dtos/add_invoice_dto.dart';

class ReimbursementInvoiceDto {
  String tin;
  String originalInvoiceCode;
  String comment;
  ItemInvoiceDto items;

  ReimbursementInvoiceDto({required this.tin, required this.originalInvoiceCode,
    required this.comment, required this.items});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'tin': tin,
      'originalInvoiceCode': originalInvoiceCode,
      'comment': comment,
      'items': items.toJson()
    };
    return data;
  }

  factory ReimbursementInvoiceDto.fromJson(Map<String, dynamic> json) {
    return ReimbursementInvoiceDto(
        tin: json['tin'],
        originalInvoiceCode: json['originalInvoiceCode'],
        comment: json['comment'],
        items: json['items']
    );
  }
}
