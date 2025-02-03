import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class PriceCard extends StatelessWidget {
  final String date;
  final String price;
  final int index;

  const PriceCard({super.key, required this.date, required this.price, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(index != 0)...[
          Text(date, style: const TextStyle(color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Groupe de taxe",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Text("TTC     HT     TS", style: TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Taxable (18%)",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: KStyles.blackColor),
            ),
            Text(
              "10.000     9200     0",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: KStyles.blackColor),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}