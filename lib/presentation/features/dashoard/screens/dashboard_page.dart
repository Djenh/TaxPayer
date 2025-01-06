import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/scan_verify_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Builder(
                 builder: (context) {
                   return IconButton(
                     icon: const CircleAvatar(
                       child: Center(
                         child: Icon(Iconsax.user),
                       ),
                     ), onPressed: () {
                     Scaffold.of(context).openDrawer();
                   },
                   );
                 },
                  ),
                  const SizedBox(
                    width: padding,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Bonjour"),
                      Text(
                        "${AppServices.instance.currentCompany.value?.name}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => const ScanVerifyPage());
                  }, icon: const CircleAvatar(child: Icon(Iconsax.scan)))
            ],
          ),
          const SizedBox(
            height: padding,
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: [
                   Theme.of(context).colorScheme.primary.withOpacity(0.3),
                   Theme.of(context).colorScheme.primary.withOpacity(0.5),
                   Theme.of(context).colorScheme.primary.withOpacity(0.7),
                   Theme.of(context).colorScheme.primary.withOpacity(0.9),
                   Theme.of(context).colorScheme.primary,
                 ],
                 transform:const GradientRotation(pi/5)
               ),
                borderRadius: BorderRadius.circular(padding)),
          ),
          const SizedBox(
            height: padding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Points de affaires",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text("voir tout"))
            ],
          ),
          const SizedBox(
            height: padding,
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.5)),
                borderRadius: BorderRadius.circular(padding)),
            child: DefaultTabController(
              initialIndex: 0,
              length: 3,
              child: Column (
                children: [
                  const TabBar(tabs: [
                    Tab(
                  //    icon: Icon(Iconsax.wallet),
                      text: "Ventes",
                    ),
                    Tab(
                    //  icon: Icon(Iconsax.money),
                      text: "Stoks",
                    ),
                    Tab(
                      text: "Impots",
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
                      Container(
                        padding: const EdgeInsets.all(padding),
                        child: const Column(
                          children: [
                            Text("Ventes")
                          ],
                        ),
                      ),
                      Container(),
                      Container(),
                    ]),
                  )
                ],
              ),
            ),
          ),
          ...List.generate(
              4,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: padding),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: padding / 2, vertical: padding),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: padding * 2.7,
                            child: Center(
                              child: Icon(Iconsax.bill),
                            ),
                          ),
                          const SizedBox(width: padding),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Agence béninisoise du trésor public",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                const KtextGray("4 articles"),
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("400000 XOF"),
                                Text("PAYE"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
