import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/ui/kTextgray.dart';

class TypeInvoicePage extends StatelessWidget {
  const TypeInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Les types de factures"),
            KtextGray("Choisissez le type de facture applicable  "),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Text("A"),
            ),
            title: const Text("Facture de ventes"),
            subtitle:
                const Text("Concernes toutes les ventes sur le territoire"),
            onTap: () {
              Get.back<String>(result: "result");
            },
          ),
        ],
      ),
    );
  }
}
