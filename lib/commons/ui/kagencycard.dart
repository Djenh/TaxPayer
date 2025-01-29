import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class KAgencycard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color? borderColor;
  final IconData? icon;
  final VoidCallback onPressed;
  final double? height;
  final double? width;

  const KAgencycard({super.key, required this.title, required this.subTitle, this.borderColor, this.icon, required this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height??85,
        width: width??180,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: borderColor??KStyles.primaryColor,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: borderColor??KStyles.primaryColor,
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 10,color: KStyles.blackColor),),
            Text(subTitle, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12,color: KStyles.blackColor),),
          ],
        )
      ),
    );
  }
}