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
        title: Text("Les clients"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.search_normal))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ClientItem(
          onTap: () => Get.to(() => ClientDetailPage()),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>ClientCreatePage());
        },
        child: Icon(Iconsax.add),
      ),
    );
  }
}
