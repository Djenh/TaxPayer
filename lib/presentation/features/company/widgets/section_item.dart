import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/button/kcirclebutton.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class SectionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onPressed;
  const SectionItem({super.key, required this.icon, required this.title, required this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            KCircleButton(
              color: KStyles.cardGrey,
              onPressed: () {

              },
              child: Icon(icon,color: Colors.black54),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}