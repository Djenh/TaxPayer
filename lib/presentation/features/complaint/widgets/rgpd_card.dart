import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class RgpdCard extends StatelessWidget {
  final String title;
  final String subTitle;

  const RgpdCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(padding),
        height: 50,
        decoration: BoxDecoration(
            color: KStyles.primaryColor.withOpacity(0.3),
            border: Border.all(
                width: 1,
                color: KStyles.primaryColor.withOpacity(0.3),
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Iconsax.security, size: 24,),
            const SizedBox(width: padding,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14,color: KStyles.primaryColor),),
                  const SizedBox(height: padding5),
                  Flexible(
                    child: Text(subTitle,
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color: KStyles.primaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
