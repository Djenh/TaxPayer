import 'package:flutter/material.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/utils.dart';


class PriceCard extends StatelessWidget {
  final PricingResponse pricingResponse;
  final int index;
  const PriceCard({super.key, required this.pricingResponse,required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(Utils.formatAndTime(pricingResponse.createdAt!), style: const TextStyle(color: Colors.black54, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text("${pricingResponse.amount}",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            if(index == 0)...[
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: const Size(120, 40)
                ),
                child: const Text("Prix courant",style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
              ),
            ]
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                children: [
                  const Text(
                    "Groupe de taxe",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: padding5),
                  Text(
                    "Taxable (${pricingResponse.taxGroup?.rate??0}%)",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: KStyles.blackColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: padding),
            Flexible(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text("TTC", style: TextStyle(fontSize: 12))),
                      SizedBox(width: padding),
                      Flexible(
                          child: Text("HT", style: TextStyle(fontSize: 12))),
                      SizedBox(width: padding),
                      Flexible(
                          child: Text("TS", style: TextStyle(fontSize: 12))),
                    ],
                  ),
                  const SizedBox(height: padding5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          Utils.getFormattedAmountOne(pricingResponse.subTotal?.ttc??0),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: KStyles.blackColor),
                        ),
                      ),
                      const SizedBox(width: padding),
                      Flexible(
                        child: Text(
                          Utils.getFormattedAmountOne(pricingResponse.subTotal?.ht??0),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: KStyles.blackColor),
                        ),
                      ),
                      const SizedBox(width: padding),
                      Flexible(
                        child: Text(
                          Utils.getFormattedAmountOne(pricingResponse.subTotal?.specificTax??0),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: KStyles.blackColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}