class AddCategoryComplaintDto {

  String name;
  String description;

  AddCategoryComplaintDto({required this.name, required this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'description': description
    };
    return data;
  }

  factory AddCategoryComplaintDto.fromJson(Map<String, dynamic> json) {
    return AddCategoryComplaintDto(
      name: json['name'],
      description: json['description']
    );
  }
}