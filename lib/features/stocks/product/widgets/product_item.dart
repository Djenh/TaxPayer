
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/style/e_style.dart';

import '../../../../commons/widgets/kTextgray.dart';
import '../screens/product_create_page.dart';

class ProductItem extends StatelessWidget {
  final void Function()? onTap;

  const ProductItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      Container(
        child: Row(
          children: [
            Expanded(child: Row(
              children: [
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(PADDING)),
                ),
                SizedBox(
                  width: PADDING,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lait Javo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    KtextGray("Produit Laitier"),
                    SizedBox(
                      height: PADDING/2,
                    ),

                    KtextGray("Disponible en stocks"),

                  ],
                ),
              ],
            )),
            SizedBox(
              width: PADDING,
            ),
            Column(
              children: [
                Icon(
                  Iconsax.box,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: PADDING,
                ),
                Text("29/20"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
