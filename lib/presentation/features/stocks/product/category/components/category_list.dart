import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class KCategoryList extends StatelessWidget {
  const KCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => ListTile(
        leading: const CircleAvatar(child: Icon(Iconsax.menu_board)),
        title: const Text("Produit laitier",) ,
        subtitle: const Text("PL", style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {
          Get.back( result:"Produit laitier");
        },
      ),
    );
  }
}
