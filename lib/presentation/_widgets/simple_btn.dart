import 'package:flutter/material.dart';

import '../res/style/e_style.dart';
import 'build_text.dart';

class SimpleBtn extends StatelessWidget {
  const SimpleBtn({super.key, required this.titleBtn, this.sizeFont,
    this.onPressed});

  final String titleBtn;
  final double? sizeFont;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: KStyles.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: buildText(context, titleBtn,
          sizeFont ?? 14, Colors.white, fontWeight: FontWeight.w400),
    );
  }
}
