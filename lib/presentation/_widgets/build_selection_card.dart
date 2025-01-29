import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class BuildSelectionCard extends StatelessWidget {
  const BuildSelectionCard({super.key, required this.title,
    required this.isSelected, required this.onTap});

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? KStyles.primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? KStyles.primaryColor : Colors.grey,
              size: 18,
            ),
            const SizedBox(width: 8),
            buildText(context, title, 14,
                isSelected ? KStyles.primaryColor : Colors.black,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }

}
