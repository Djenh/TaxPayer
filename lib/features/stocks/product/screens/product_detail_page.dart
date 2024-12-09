import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/features/stocks/product/screens/product_create_page.dart';
import 'package:invoice_app/features/stocks/product/widgets/product_item.dart';
import 'package:invoice_app/style/e_style.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => ProductCreatePage());
              },
              icon: const Icon(Iconsax.edit_2))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: PADDING * 2),
        child: Column(
          children: [
            const ProductItem(),
            const SizedBox(
              height: PADDING,
            ),
            const Divider(
              color: Colors.black12,
            ),
            Expanded(
              child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(tabs: [
                        Tab(
                          text: "Stocks",
                          icon: Icon(Iconsax.archive_2),
                        ),
                        Tab(
                          text: "Prix",
                          icon: Icon(Iconsax.money_add),
                        ),
                        Tab(
                          text: "Autre",
                          icon: Icon(Iconsax.setting),
                        ),
                      ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: TabBarView(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: PADDING),
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Points du stocks",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Iconsax.add),
                                      label: const Text("Ajouter"),
                                    ),
                                  ],
                                ),
                                ...ListTile.divideTiles(
                                  color: Colors.grey,
                                    tiles: List.generate(
                                        10,
                                        (index) => const ListTile(
                                          contentPadding: EdgeInsets.zero,
                                              leading: CircleAvatar(child: Icon(Iconsax.receipt_1)),
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Quatitté"),
                                                      Text("120"),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text("Expire le "),
                                                      Text("20/20/101"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )))
                              ],
                            ),
                          ),
                          Container(),
                          Container(),
                        ]),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
