enum ProductType { goods, }

extension ProductTypeExtension on ProductType {
  String get name {
    switch (this) {
      case ProductType.goods:
        return 'Biens';
      default:
        return 'Services';
    }
  }
}