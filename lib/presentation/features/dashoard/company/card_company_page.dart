import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/kcompanycard.dart';
import 'package:invoice_app/presentation/features/registration/_widgets/indicator.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class CompanyCard extends StatelessWidget {
  final bool showAction;
  final Widget? child;
  final VoidCallback? onPressed;
  const CompanyCard({super.key,required this.showAction,this.child,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            KComanyCard(
              height: 64,
              width: 64,
              color: KStyles.cardGrey,
              onPressed: () {

              },
              child: const Icon(Iconsax.courthouse,color: KStyles.primaryColor,size: 32),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Indicator(
                  shp: BoxShape.rectangle,
                  color: KStyles.yellowI,
                  wdt: 30,
                  hgt: 6,
                ),
                Text(
                  "La nationale",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: KStyles.primaryColor,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "Entreprise",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      " | ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      "Actif",
                      style: TextStyle(fontSize: 14, color: KStyles.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        if(showAction)
          GestureDetector(
            onTap: onPressed,
            child: child,
          ),
      ],
    );
  }
}