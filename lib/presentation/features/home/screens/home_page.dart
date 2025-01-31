import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/complaint/screens/complaint_page.dart';
import 'package:invoice_app/presentation/features/pos/screens/pos_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../dashoard/screens/dashboard_page.dart';
import '../../sales/invoice/widgets/invoice_list.dart';
import '../../sales/tombola/screens/participate_tombola_page.dart';
import '../controler/home_controller.dart';
import '../widgets/menus/side_menu.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        drawer: const Drawer(
          child: SideMenu(),
        ),
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: controller.selectedIndex.value,
              children: [
                const DashboardPage(),
                const InvoiceList(),
                const PosPage(isManage: false),
                ParticipateTombolaPage(),
                //Container(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => Container(
            decoration: const BoxDecoration(
              color: KStyles.primaryColor,
              /*borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),*/
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  index: 0,
                  icon: Iconsax.home_1,
                  label: "Accueil",
                  isSelected: controller.selectedIndex.value == 0,
                  onTap: () => controller.selectedIndex.value = 0,
                ),
                _buildNavItem(
                  index: 1,
                  icon: Iconsax.bill,
                  label: "Factures",
                  isSelected: controller.selectedIndex.value == 1,
                  onTap: () => controller.selectedIndex.value = 1,
                ),
                _buildNavItem(
                  index: 2,
                  icon: Iconsax.shop,
                  label: "Agence",
                  isSelected: controller.selectedIndex.value == 2,
                  onTap: () => controller.selectedIndex.value = 2,
                ),
                /*_buildNavItem(
                  index: 3,
                  icon: Iconsax.activity,
                  label: "Rapports",
                  isSelected: controller.selectedIndex.value == 3,
                  onTap: () => controller.selectedIndex.value = 3,
                ),*/
                _buildNavItem(
                  index: 3,
                  icon: Iconsax.setting,
                  label: "Paramètres",
                  isSelected: controller.selectedIndex.value == 3,
                  onTap: () => controller.selectedIndex.value = 3,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: isSelected
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  )
                : null,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Icon(
              icon,
              color: isSelected ? KStyles.primaryColor : Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
