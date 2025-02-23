
class AddComplaintDto {

  String subject;
  String content;
  String? upload;
  String? concernTin;
  String? concernName;
  String concernInvoiceSignature;
  ComplainantDto complainant;
  String categoryCode;


  AddComplaintDto({required this.subject, required this.content,
    required this.upload, required this.concernTin, required this.concernName,
    required this.concernInvoiceSignature, required this.complainant,
    required this.categoryCode });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'subject': subject,
      'content': content,
      'concernInvoiceSignature': concernInvoiceSignature,
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



class ComplainantDto {

  String firstName;
  String lastName;
  String? email;
  String? phoneNumber;

  ComplainantDto({required this.firstName, required this.lastName,
    required this.email, required this.phoneNumber });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName
    };

    if(email != null){
      data["email"] = email;
    }
    if(phoneNumber != null){
      data["phoneNumber"] = phoneNumber;
    }

    return data;
  }

  factory ComplainantDto.fromJson(Map<String, dynamic> json) {
    return ComplainantDto(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber']
    );
  }
}