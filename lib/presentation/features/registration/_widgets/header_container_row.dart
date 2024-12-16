import 'package:flutter/material.dart';


class HeaderContainerRow extends StatelessWidget {
  const HeaderContainerRow({super.key, required this.icon, required this.title,
    required this.subTitle});

  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 48),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(color: Colors.black, fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(color: Colors.black, fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}