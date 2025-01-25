import 'package:diacritic/diacritic.dart';


class NameVo {
  final String value;

  NameVo(this.value, {bool first = false}) {
    if (value.trim().isEmpty) {
      throw const FormatException("Champ requis");
    } /*else if (!_valideName(value)) {
      throw FormatException(
          first ? "Nom invalide" : "Prénom invalide");
    }*/
  }
  static bool isValid(String name) {
    return validate(name) == null;
  }

  static String? validate(String name, {bool first = false}) {
    try {
      NameVo(name, first: first);
      return null;
    } on FormatException catch (e) {
      return e.message;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameVo &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;

  bool _valideName(String str) {
    final RegExp regex1 = RegExp(r"^[a-zA-Z'à-öø-ÿ]{2,}( [a-zA-Z'à-öø-ÿ]{2,})*$");
    final RegExp regex2 = RegExp(r'^(\w{2,}\s{0,}){0,}\w{2,}$');
    return regex1.hasMatch(removeDiacritics(str)) &&
        regex2.hasMatch(removeDiacritics(str));
  }
}
