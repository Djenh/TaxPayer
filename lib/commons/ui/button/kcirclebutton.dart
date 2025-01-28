import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class KCircleButton extends StatelessWidget {
  final Widget child;
  final Color? color;

  final VoidCallback onPressed;

  const KCircleButton({super.key, required this.child, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration:  BoxDecoration(
          color: color??KStyles.primaryColor, // border color
          shape: BoxShape.circle,
        ),
        height: 35,
        width: 35,
        child: Center(child: child),
      ),
    );
  }
}