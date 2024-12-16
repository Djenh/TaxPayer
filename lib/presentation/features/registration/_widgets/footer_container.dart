import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../res/style/e_style.dart';
import '../_strings/register_str.dart';
import 'indicator.dart';

class FooterContainer extends StatelessWidget {
  const FooterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: KStyles.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          const Icon(Iconsax.user, size: 28.0, color: Colors.black),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  RegisterStr.infoRegister,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Row(
                  children: [
                    Indicator(
                      shp: BoxShape.rectangle,
                      color: KStyles.yellowI,
                      wdt: 30,
                      hgt: 6,
                    ),
                    Indicator(
                      shp: BoxShape.circle,
                      color: KStyles.secondaryColor,
                      wdt: 16,
                      hgt: 8,
                    ),
                    Indicator(
                      shp: BoxShape.circle,
                      color: KStyles.blackColor,
                      wdt: 16,
                      hgt: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
