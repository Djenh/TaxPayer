import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class KtextGray extends StatelessWidget {
  final String? data;
  const KtextGray(this.data, {super.key, });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$data",
      style: kTheme.getDividedTextTheme(context),
    );
  }
}
