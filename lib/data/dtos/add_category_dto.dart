class AddCategoryDto {

  String code;
  String name;

  AddCategoryDto({required this.code, required this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'code': code,
      'name': name
    };
    return data;
  }

  factory AddCategoryDto.fromJson(Map<String, dynamic> json) {
    return AddCategoryDto(
      code: json['code'],
      name: json['name'],
    );
  }
}