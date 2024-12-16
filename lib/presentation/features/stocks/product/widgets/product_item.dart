import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';



class ProductItem extends StatelessWidget {
  final void Function()? onTap;

  const ProductItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      Row(
        children: [
          Expanded(child: Row(
            children: [
              Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(padding)),
              ),
              const SizedBox(
                width: padding,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lait Javo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  KtextGray("Produit Laitier"),
                  SizedBox(
                    height: padding/2,
                  ),

                  KtextGray("Disponible en stocks"),

                ],
              ),
            ],
          )),
          const SizedBox(
            width: padding,
          ),
          const Column(
            children: [
              Icon(
                Iconsax.box,
                color: Colors.grey,
              ),
              SizedBox(
                height: padding,
              ),
              Text("29/20"),
            ],
          ),
        ],
      ),
    );
  }
}
