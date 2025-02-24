import 'add_complainant_dto.dart';

class AddComplaintDto {

  String subject;
  String content;
  String? upload;
  String? concernTin;
  String? concernName;
  String? concernInvoiceSignature;
  AddComplainantDto complainant;
  String categoryCode;


  AddComplaintDto({required this.subject, required this.content,
    required this.upload, required this.concernTin, required this.concernName,
    required this.concernInvoiceSignature, required this.complainant,
    required this.categoryCode });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'subject': subject,
      'content': content,
      'complainant': complainant,
      'categoryCode': categoryCode,
    };

    if(upload != null){
      data["upload"] = upload;
    }
    if(concernTin != null){
      data["concernTin"] = concernTin;
    }
    if(concernName != null){
      data["concernName"] = concernName;
    }
    if(concernInvoiceSignature != null){
      data["concernInvoiceSignature"] = concernInvoiceSignature;
    }

    return data;
  }

  factory AddComplaintDto.fromJson(Map<String, dynamic> json) {
    return AddComplaintDto(
        subject: json['subject'],
        content: json['content'],
        upload: json['upload'],
        concernTin: json['concernTin'],
        concernName: json['concernName'],
        concernInvoiceSignature: json['concernInvoiceSignature'],
        complainant: json['complainant'],
        categoryCode: json['categoryCode']
    );
  }
}
