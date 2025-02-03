import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';
import 'package:invoice_app/presentation/features/stocks/product/widgets/price_card.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../widgets/product_item.dart';



class ProductDetailPage extends StatefulWidget {
  final ProductResponse ctg;
  const ProductDetailPage({super.key,required this.ctg});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final prodCtr = locator<ProductCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    prodCtr.productPricesController = PagingController<int, PricingResponse>(firstPageKey: 0);
    prodCtr.productPricesController?.addPageRequestListener((pageKey) {
      prodCtr.getProductPrices(widget.ctg.code??"",pageKey);
    });
  }


  @override
  void dispose() {
    super.dispose();
    prodCtr.productPricesController?.dispose();
    prodCtr.productPricesController = null;
  }

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
            ProductItem(ctg: widget.ctg),
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
                              const SizedBox(height: 26),
                              Expanded(
                                child:  LayoutBuilder(
                                  builder: (_, cxs) {
                                    return PagedListView<int, PricingResponse>.separated(
                                      pagingController: prodCtr.productPricesController!,
                                      separatorBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Divider(
                                            height: 1, thickness: 1, color: Colors.grey.shade300),
                                      ),
                                      builderDelegate: PagedChildBuilderDelegate<PricingResponse>(
                                        itemBuilder: (context, ctg, index) {
                                          return PriceCard(
                                            pricingResponse: ctg,
                                            index: index,
                                          );
                                        },
                                        firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                        newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                        noItemsFoundIndicatorBuilder: (_) => _noItem(),
                                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: prodCtr.productPricesController, cxs: cxs),
                                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: prodCtr.productPricesController),
                                      ),
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
  Widget _noItem(){
    return Center(
      child: buildText(context, "Aucun Prix disponible.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }
}



