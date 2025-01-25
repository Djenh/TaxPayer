class AddUnitDto {

  String code;
  String name;
  String description;

  AddUnitDto({required this.code, required this.name, required this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'code': code,
      'name': name,
      'description': description
    };
    return data;
  }

  factory AddUnitDto.fromJson(Map<String, dynamic> json) {
    return AddUnitDto(
      code: json['code'],
      name: json['name'],
      description: json['description'],
    );
  }
}