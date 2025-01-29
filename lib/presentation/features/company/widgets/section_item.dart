import 'package:flutter/material.dart';


class SectionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const SectionItem({super.key, required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}