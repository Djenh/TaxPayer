class PhoneVo {
  final String value;

  PhoneVo(this.value) {
    if (value.trim().isEmpty) {
      throw const FormatException("Ce champ ne doit pas être vide.");
    } else if (!isValidPhone(value)) {
      throw const FormatException("Numéro de téléphone invalide.");
    }
  }

  /// Méthode statique pour valider un numéro
  static bool isValid(String phone) {
    return validate(phone) == null;
  }

  /// Méthode statique pour renvoyer un message d'erreur ou null si valide
  static String? validate(String phone) {
    try {
      PhoneVo(phone);
      return null;
    } on FormatException catch (e) {
      return e.message;
    }
  }

  /// Méthode pour vérifier si le numéro est valide
  static bool isValidPhone(String phone) {
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
    return phoneRegExp.hasMatch(phone);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PhoneVo &&
              runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
