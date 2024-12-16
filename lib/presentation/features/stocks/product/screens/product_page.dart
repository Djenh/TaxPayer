import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_create_page.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_detail_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../widgets/product_item.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produits"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: padding * 2, vertical: padding),
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.only(bottom: padding), child: ProductItem(
            onTap:  () {
              Get.to(() => const ProductDetailPage());
            },
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Iconsax.add),
        onPressed: () => Get.to(() => const ProductCreatePage()),
      ),
    );
  }
}
