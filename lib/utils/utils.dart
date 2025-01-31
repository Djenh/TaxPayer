import 'dart:ui' as ui;
import 'package:intl/intl.dart';

class Utils{
  static String getFormattedAmount(num solde) {
    return NumberFormat.currency(
      locale: ui.window.locale.languageCode,
      decimalDigits: 2,
      symbol: '',
    ).format(solde);
  }
}
