import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/style/e_style.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  width: PADDING,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Bonjour"),
                    Text(
                      "OMEGA NUMERIC IT",
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
                onPressed: () {}, icon: const CircleAvatar(child: Icon(Iconsax.scan)))
          ],
        ),
        const SizedBox(
          height: PADDING,
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
              borderRadius: BorderRadius.circular(PADDING)),
        ),
        const SizedBox(
          height: PADDING,
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
          height: PADDING,
        ),
        Container(
          height: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.5)),
              borderRadius: BorderRadius.circular(PADDING)),
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
                      padding: const EdgeInsets.all(PADDING),
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
                  padding: const EdgeInsets.only(bottom: PADDING),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: PADDING / 2, vertical: PADDING),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: PADDING * 2.7,
                          child: Center(
                            child: Icon(Iconsax.bill),
                          ),
                        ),
                        const SizedBox(width: PADDING),
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
    );
  }
}
