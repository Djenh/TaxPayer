import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, this.onPressed,});

  final String title;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: KStyles.primaryColor, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16,
          color: KStyles.primaryColor),
      ),
    );
  }
}