import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class KComanyCard extends StatelessWidget {
  final Widget child;
  final Color? color;

  final VoidCallback onPressed;
  final double height;
  final double width;

  const KComanyCard({super.key, required this.child, this.color, required this.onPressed, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color??KStyles.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}