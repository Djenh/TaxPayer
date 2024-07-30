import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class KTextWhite   extends StatelessWidget {
  final String? data;
  const KTextWhite(this.data, {super.key, });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$data",
      style: kTheme.getWhiteTextTheme(context),
    );
  }
}
