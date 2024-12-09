import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/style/e_style.dart';

import '../screens/invoice_create_page.dart';
import '../screens/invoice_detail_page.dart';
import 'invoice_item.dart';

class InvoiceList extends StatelessWidget {
  const InvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Les factures",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
                IconButton(
                    onPressed: () => Get.to(() => InvoiceCreatePage()),
                    icon: const CircleAvatar(
                        child: Center(child: Icon(Iconsax.add)))),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: KStyles.elevationMedium * 2,
        ),
        ...List.generate(
            4,
            (index) => InvoiceItem(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InvoiceDetailPage(),
                      )),
                ))
      ],
    );
  }
}
