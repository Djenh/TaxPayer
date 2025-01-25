// ignore_for_file: constant_identifier_names
enum CustomerType { COMPANY, INDIVIDUAL, INSTITUTION, PROFESSIONAL, COMMERCE }

extension CustomerTypeExtension on CustomerType {
  String get name {
    switch (this) {
      case CustomerType.COMPANY:
        return 'Company';
      case CustomerType.INDIVIDUAL:
        return 'Individual';
      case CustomerType.INSTITUTION:
        return 'Institution';
      case CustomerType.PROFESSIONAL:
        return 'Professional';
      case CustomerType.COMMERCE:
        return 'Commerce';
      default:
        return 'Company';
    }
  }
}

String getCustomerTypeLabel(CustomerType type) {
  switch (type) {
    case CustomerType.COMPANY:
      return 'Entreprise';
    case CustomerType.INDIVIDUAL:
      return 'Particulier';
    case CustomerType.INSTITUTION:
      return 'Institution';
    case CustomerType.PROFESSIONAL:
      return 'Professionnel';
    case CustomerType.COMMERCE:
      return 'Commerce';
    default:
      return 'Inconnu';
  }
}