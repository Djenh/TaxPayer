import 'package:flutter/material.dart';

import '../../presentation/res/style/e_style.dart';

class KStatisticard extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  final double? height;
  final double? width;

  const KStatisticard({super.key, required this.title, required this.subTitle,required this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: height??85,
          width: width??180,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: KStyles.bgStatColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
      ),
    );
  }
}

