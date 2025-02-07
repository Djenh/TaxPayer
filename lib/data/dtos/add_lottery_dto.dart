
class AddLotteryDto {

  String signature;
  int issuedDateTimestamp;
  String participant;
  String phone;
  String? email;
  int totalInvoice;

  AddLotteryDto({required this.signature,
    required this.issuedDateTimestamp, required this.participant,
    required this.phone, this.email, required this.totalInvoice});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'signature': signature,
      'issuedDateTimestamp': issuedDateTimestamp,
      'participant': participant,
      'phone': phone,
      'totalInvoice': totalInvoice,
    };

    if(email != null){
      data["email"] = email;
    }

    return data;
  }

  factory AddLotteryDto.fromJson(Map<String, dynamic> json) {
    return AddLotteryDto(
        signature: json['signature'],
        issuedDateTimestamp: json['issuedDateTimestamp'],
        participant: json['participant'],
        phone: json['phone'],
        email: json['email'],
        totalInvoice: json['totalInvoice']
    );
  }
}