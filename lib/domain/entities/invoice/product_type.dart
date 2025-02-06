class ProductType {
  String? id;
  String? code;
  String? name;
  String? description;

  ProductType({
    this.id,
    this.code,
    this.name,
    this.description,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
  };
}