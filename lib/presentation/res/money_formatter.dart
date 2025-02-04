import 'package:intl/intl.dart';

class MoneyFormatter {
  static final money = NumberFormat("#,##0.0", "fr_FR");

  static final moneyIn = NumberFormat('#,##0', 'fr_FR');

  static String getMoney(num value, {bool addDevice = true}) =>
      ((value.ceil() == value.floor())
          ? moneyIn.format(value)
          : money.format(value)) +
      (addDevice ? ' FCFA' : '');
}
