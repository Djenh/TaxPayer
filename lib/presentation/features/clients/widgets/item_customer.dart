import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class ItemCustomer extends StatelessWidget {
   const ItemCustomer({super.key, required this.cusData,
     required this.onAction});

  final CustomerEntities? cusData;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onAction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(Iconsax.courthouse, color: Colors.black),
                  const SizedBox(width: 15),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(context, cusData?.code ?? "---", 12, Colors.black,
                            fontWeight: FontWeight.w400, textAlign: TextAlign.start),
                        buildText(context, cusData?.name ?? "---", 12, Colors.black,
                            fontWeight: FontWeight.w700, textAlign: TextAlign.start,
                            maxLine: 3)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: KStyles.cardGrey,
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: buildText(context, cusData?.typeClient ?? "---", 12, Colors.grey,
                    fontWeight: FontWeight.w400, textAlign: TextAlign.start),
              ),
            )
          ],
        ),
      ),
    );
  }
}
