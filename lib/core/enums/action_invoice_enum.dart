// ignore_for_file: constant_identifier_names
enum ActionInvoiceType { CALCULATION, DEFINITIVE_SUBMIT }

extension ActionInvoiceTypeExtension on ActionInvoiceType {
  String get name {
    switch (this) {
      case ActionInvoiceType.CALCULATION:
        return 'CALCULATION';
      case ActionInvoiceType.DEFINITIVE_SUBMIT:
        return 'DEFINITIVE_SUBMIT';
      default:
        return 'CALCULATION';
    }
  }
}