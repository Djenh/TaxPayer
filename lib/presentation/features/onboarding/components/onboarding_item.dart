import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final IconData? iconData;
  final bool isReversed;

  final Widget? action;

  const OnboardingItem(
      {super.key,
      required this.title,
      this.iconData,
      required this.image,
      this.action,
      this.isReversed = false,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return KDefaultLayout(
        title: "Byte Enterprise Suite 🇧🇯",
        subtitle: "Byte your business",
        imagePath: image,
        isReversed: isReversed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: padding * 5),
            Row(
              children: [
                Icon(
                  iconData ?? Iconsax.user,
                  size: 70, color: Colors.black45,
                ),
                const SizedBox(width: padding * 2),
                Expanded(
                  child: Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: padding * 5),
            Text(description,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 21/14
                )),
            const SizedBox(height: padding * 2),
            action ?? Container()
          ],
        ));
  }
}
