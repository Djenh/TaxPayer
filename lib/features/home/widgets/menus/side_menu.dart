import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/features/pos/screens/pos_page.dart';
import 'package:invoice_app/style/e_style.dart';

import '../../../clients/screens/client_page.dart';
import '../../../stocks/product/screens/product_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(PADDING),
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    SizedBox(
                      height: PADDING,
                    ),
                    Text(
                      "OMEGA NUMERIC IT",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Iconsax.building,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Mon entreprise"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Iconsax.card_pos,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Points de vente"),
            onTap: () {
              Get.to(()=>PosPage());
            },
          ),
          ListTile(
            leading: Icon(
              Iconsax.people,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Clients"),
            onTap: () {
              Get.to(() => ClientPage() );
            },
          ),
          ListTile(
            leading: Icon(
              Iconsax.bag_2,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Produits"),
            onTap: () {
              Get.to(() => ProductPage() );
            },
          ),
          ListTile(
            leading: Icon(
              Iconsax.status_up,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Fiscalités"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Iconsax.status_up,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Caisse"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
