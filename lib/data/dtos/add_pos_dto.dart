class AddPosDto {

  String name;
  String description;
  String tin;
  String phone;
  String email;
  String address;

  AddPosDto({required this.name, required this.description, required this.tin,
    required this.phone, required this.email, required this.address});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'description': description,
      'tin': tin,
      'phone': phone,
      'email': email,
      'address': address
    };
    return data;
  }

  factory AddPosDto.fromJson(Map<String, dynamic> json) {
    return AddPosDto(
      name: json['name'],
      description: json['description'],
      tin: json['tin'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
    );
  }
}
