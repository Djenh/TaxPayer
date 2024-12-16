
class FieldVo {
  final String value;

  FieldVo(this.value, {bool first = false}) {
    if (value.trim().isEmpty) {
      throw const FormatException("Champ requis");
    }
  }

  static String? validate(String name, {bool first = false}) {
    try {
      FieldVo(name, first: first);
      return null;
    } on FormatException catch (e) {
      return e.message;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FieldVo &&
              runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;

}
