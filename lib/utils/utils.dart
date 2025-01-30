import 'dart:ui' as ui;
import 'package:intl/intl.dart';

class Utils{
  static String getFormattedAmount(num solde) {
    return NumberFormat.currency(
      locale: ui.window.locale.languageCode,
      decimalDigits: 2,
      symbol: '', // if you want to add currency symbol then pass that in this else leave it empty.
    ).format(solde);
  }
}