class ContactDto {

  String phoneNumber;
  String email;
  String? websiteUrl;

  ContactDto({required this.phoneNumber, required this.email, this.websiteUrl});

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = <String, dynamic>{
      'phoneNumber': phoneNumber,
      'email': email
    };

    if(websiteUrl != null){
      data["websiteUrl"] = websiteUrl;
    }

    return data;
  }

  factory ContactDto.fromJson(Map<String, dynamic> json) {
    return ContactDto(
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        websiteUrl: json['websiteUrl']
    );
  }

}