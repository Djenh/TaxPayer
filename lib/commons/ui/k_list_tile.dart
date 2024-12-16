import 'package:flutter/material.dart';

import 'k_text_gray.dart';

class KListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const KListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 4),

        decoration: const BoxDecoration(

          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black38, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                KtextGray(
                  title,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

              ],
            ),
            const Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }
}
