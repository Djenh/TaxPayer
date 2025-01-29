import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/button/kelevatedbutton.dart';
import 'package:invoice_app/presentation/res/assets/app_assets.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/custom_image_view.dart';

class Kemptydata extends StatelessWidget {
  final String? text;
  final String? textButton;
  final VoidCallback onPressed;
  const Kemptydata({super.key, this.text, this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          height: 100,
          width: 100,
          imagePath: $appAssets.svgs.svEmpytData,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: padding,
        ),
        Text(text!,
          style: const TextStyle(fontSize: 14, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: padding,
        ),
        KElevatedButton(
          onPressed: onPressed,
          child: Text(textButton!),
        )
      ],
    );
  }
}