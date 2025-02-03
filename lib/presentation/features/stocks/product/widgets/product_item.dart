import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/utils.dart';



class ProductItem extends StatelessWidget {
  final ProductResponse ctg;
  final void Function()? onTap;

  const ProductItem({super.key, this.onTap,required this.ctg});

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
                    color: KStyles.textLightColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(padding)),
              ),
              const SizedBox(
                width: padding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ctg.name??"",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),

                  KtextGray(Utils.typeProduct(ctg.productType!)),
                  const SizedBox(
                    height: padding/2,
                  ),

                  const KtextGray("Quantité"),

                ],
              ),
            ],
          )),
          const SizedBox(
            width: padding,
          ),
          const Column(
            children: [
              /*
              Icon(
                Iconsax.box,
                color: Colors.grey,
              ),
               */
              SizedBox(
                height: padding*4,
              ),
              Text("29/20"),
            ],
          ),
        ],
      ),
    );
  }
}
