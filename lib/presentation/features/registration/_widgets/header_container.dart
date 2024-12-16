import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../res/style/e_style.dart';


class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key, required this.title,
    required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Iconsax.password_check, color: Colors.black, size: 38),
        const SizedBox(height: 10),
        Text(
         title,
          style: Theme.of(context).textTheme.bodyMedium!
              .copyWith(color: KStyles.primaryColor, fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium!
              .copyWith(color: Colors.black, fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
