import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:invoice_app/style/e_style.dart';

import '../../dashoard/screens/dashboard_page.dart';
import '../../sales/invoice/widgets/invoice_list.dart';
import '../controler/home_controller.dart';
import '../widgets/menus/side_menu.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage( );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: Drawer(
          child: SideMenu(),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: PADDING * 2),
              child:Obx(() => IndexedStack(
                index: controller.selectedIndex.value,
                children: [
                  DashboardPage(),
                  InvoiceList(),
                  Container(),
                  Container(),
                ],
              ),)
          ),
        ),
        bottomNavigationBar:  Obx(
          () =>  NavigationBar(

            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (value) => controller.updateSelectedIndex(value),
            destinations: [
              NavigationDestination(
                  icon: Icon(Iconsax.home_1), label: "Accueil"),
              NavigationDestination(
                  icon: Icon(Iconsax.bill), label: "Factures"),
              NavigationDestination(
                  icon: Icon(Iconsax.archive_book), label: "Stocks"),
              NavigationDestination(
                  icon: Icon(Iconsax.setting), label: "Paramètres"),
            ],
          ),
        )
    )
    
      ;
  }
}
