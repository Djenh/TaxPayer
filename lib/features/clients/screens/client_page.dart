import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/features/clients/screens/client_create_page.dart';
import 'package:invoice_app/features/clients/screens/client_detail_page.dart';
import 'package:invoice_app/features/clients/widgets/client_item.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Les clients"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.search_normal))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ClientItem(
          onTap: () => Get.to(() => const ClientDetailPage()),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>const ClientCreatePage());
        },
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
