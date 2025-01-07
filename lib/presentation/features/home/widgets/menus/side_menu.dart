import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/clients/screens/customer_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../clients/screens/client_page.dart';
import '../../../pos/screens/pos_page.dart';
import '../../../stocks/product/screens/product_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(
                    height: padding,
                  ),
                  Text(
                    "OMEGA NUMERIC IT",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Iconsax.building,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Mon entreprise"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Iconsax.card_pos,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Points de vente"),
            onTap: () {
              Get.to(()=>const PosPage());
            },
          ),
          ListTile(
            leading: Icon(
              Iconsax.people,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Clients"),
            onTap: () {
              //Get.to(() => const ClientPage());
              Get.to(() => const CustomerPage());
            },
          ),
          ListTile(
            leading: Icon(
              Iconsax.bag_2,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Produits"),
            onTap: () {
              Get.to(() => const ProductPage(isManage: true));
            },
          ),
          ListTile(
            leading: Icon(
              Iconsax.status_up,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Fiscalités"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Iconsax.status_up,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Caisse"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
