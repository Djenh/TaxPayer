import 'package:flutter/material.dart';

import '../res/style/e_style.dart';

class FloatBtn extends StatelessWidget {
  final VoidCallback onAction;
  final IconData icn;
  const FloatBtn({super.key, required this.onAction, required this.icn});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: KStyles.primaryColor,
      onPressed: onAction,
      child: Icon(icn, color: Colors.white),
    );
  }
}
