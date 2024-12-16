import 'package:flutter_regex/flutter_regex.dart';


class EmailVo {
  final String value;

  EmailVo(this.value) {
    if (value.trim().isEmpty) {
      throw const FormatException("Ce champ doit pas etre vide.");
    } else if (!value.isEmail()) {
      throw const FormatException("Adresse e-mail invalide");
    }
  }

  static bool isValid(String email) {
    return validate(email) == null;
  }

  static String? validate(String email) {
    try {
      EmailVo(email);
      return null;
    } on FormatException catch (e) {
      return e.message;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailVo &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
