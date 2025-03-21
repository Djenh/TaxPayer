import 'package:flutter/material.dart';

class KTheme {
  static getDividedTextTheme(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Theme.of(context).dividerColor);
  }

  static getWhiteTextTheme(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Colors.white);
  }
}
