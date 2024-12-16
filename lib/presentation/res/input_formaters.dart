import 'package:flutter/services.dart';
import 'package:flutter_regex/flutter_regex.dart';

final List<TextInputFormatter> noSpaceNoEmoji = <TextInputFormatter>[
  NoEmojiFilter(),
  FilteringTextInputFormatter.singleLineFormatter,
  FilteringTextInputFormatter.deny(' '),
];

final List<TextInputFormatter> noEmojiSingleLine = <TextInputFormatter>[
  NoEmojiFilter(),
  FilteringTextInputFormatter.singleLineFormatter,
];

TextInputFormatter get noEmoji => NoEmojiFilter();

final List<TextInputFormatter> digitOnly = <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];

class DecimalNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.text != '' && num.tryParse(newValue.text) == null
        ? oldValue
        : newValue;
  }
}

class UppercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}

class NoEmojiFilter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    return TextEditingValue(
      text: newValue.text.replaceAll(RegexPattern.emoji, ''),
      selection: newValue.selection,
    );
  }
}
