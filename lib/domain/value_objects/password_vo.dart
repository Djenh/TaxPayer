
class PasswordVo {
  final String value;

  PasswordVo(this.value) {
    if (value.isEmpty) {
      throw const FormatException("Ce champ est requis.");
    }
    if (value.length < 8) {
      throw const FormatException("Le mot de passe doit contenir au moins 8 caractères.");
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      throw const FormatException("Le mot de passe doit contenir au moins une lettre majuscule.");
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      throw const FormatException("Le mot de passe doit contenir au moins un chiffre.");
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      throw const FormatException("Le mot de passe doit contenir au moins un caractère spécial.");
    }
  }

  static String? validate(String value) {
    try {
      PasswordVo(value);
      return null;
    } on FormatException catch (e) {
      return e.message;
    }
  }

  static String? match(String value1, String value2) {
    final String? s1 = validate(value1);
    final String? s2 = validate(value2);
    if (s1 == null && s2 == null) {
      if (value1 == value2) {
        return null;
      }
      return "Les deux champ doivent etre identique";
    } else {
      return s1;
    }
  }

  static bool isValid(String value) {
    return validate(value) == null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordVo &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Password{value: $value}';
}
