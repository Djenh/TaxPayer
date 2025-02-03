import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';
import 'package:invoice_app/presentation/features/stocks/product/widgets/price_card.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../widgets/product_item.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductResponse ctg;
  ProductDetailPage({super.key,required this.ctg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            "Détail de produit",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)
        ),
        actions: [
          IconButton(
              onPressed: () {
                //Get.to(() => const ProductCreatePage());
              },
              icon: const Icon(Iconsax.edit_2))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding * 2),
        child: Column(
          children: [
            ProductItem(ctg: ctg),
            const SizedBox(
              height: padding,
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
                          /*
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: padding),
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
                           */
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Historique des prix",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                      backgroundColor: Colors.grey[300],
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      fixedSize: const Size(120, 40)
                                    ),
                                    child: const Text("Ajouter",style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("12/09/2024 10:09:32", style: TextStyle(color: Colors.black54, fontSize: 12)),
                                        SizedBox(height: 4),
                                        Text(
                                          "10.000 FCFA",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: KStyles.blackColor),
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.grey[300],
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                        fixedSize: const Size(120, 40)
                                    ),
                                    child: const Text("Prix courant",style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: ListView.separated(
                                  itemCount: priceHistory.length,
                                  separatorBuilder: (context, index) => const Divider(),
                                  itemBuilder: (context, index) {
                                    return PriceCard(
                                      date: priceHistory[index]["date"],
                                      price: priceHistory[index]["price"],
                                      index: index,
                                    );
                                  },
                                ),
                              ),
                            ],
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

  final List<Map<String, dynamic>> priceHistory = [
    {"date": "12/09/2024 10:09:32", "price": "10.000 FCFA"},
    {"date": "12/09/2024 11:09:32", "price": "20.000 FCFA"},
    {"date": "12/09/2024 12:09:32", "price": "10.000 FCFA"},
    {"date": "12/09/2024 13:09:32", "price": "50.000 FCFA"},
    {"date": "12/09/2024 15:09:32", "price": "30.000 FCFA"},
    {"date": "12/09/2024 16:09:32", "price": "60.000 FCFA"},
  ];
}


