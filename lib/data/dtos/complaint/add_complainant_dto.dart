class AddComplainantDto {

  String firstName;
  String lastName;
  String? email;
  String phoneNumber;

  AddComplainantDto({required this.firstName, required this.lastName,
    required this.email, required this.phoneNumber });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber
    };

    if(email != null){
      data["email"] = email;
    }

    return data;
  }

  factory AddComplainantDto.fromJson(Map<String, dynamic> json) {
    return AddComplainantDto(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber']
    );
  }
}