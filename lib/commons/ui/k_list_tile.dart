import 'package:flutter/material.dart';

import 'kTextgray.dart';

class KListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  KListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: KtextGray(
            "${title}",
          ),
          subtitle: Text(
            "${subtitle}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: onTap,
          trailing: const Icon(Icons.arrow_drop_down),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(),
      ],
    );
  }
}
