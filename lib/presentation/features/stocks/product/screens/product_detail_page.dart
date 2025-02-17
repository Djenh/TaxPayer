import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';
import 'package:invoice_app/presentation/features/stocks/product/pricing/price_create.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_create_page.dart';
import 'package:invoice_app/presentation/features/stocks/product/widgets/price_card.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../widgets/product_item.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductResponse ctg;

  const ProductDetailPage({super.key, required this.ctg});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final prodCtr = locator<ProductCtrl>();
  ProductResponse? dataProd;
  TextEditingController? searchController;

  @override
  void initState() {
    super.initState();
    dataProd = widget.ctg;
    prodCtr.productPricesController =
        PagingController<int, PricingResponse>(firstPageKey: 0);
    prodCtr.productPricesController?.addPageRequestListener((pageKey) {
      prodCtr.getProductPrices(dataProd?.code ?? "", pageKey);
    });
  }

  Future<void> _refreshData(String uid) async {
    final ProductResponse? updatedProd =
        await prodCtr.productById(context, uid);
    if (updatedProd != null) {
      setState(() {
        dataProd = updatedProd;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    prodCtr.productPricesController?.dispose();
    prodCtr.productPricesController = null;
  }

  Widget _noItem() {
    return Center(
      child: buildText(context, "Aucun Prix disponible.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Détail de produit",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () async {
                await Get.to(
                        () => ProductCreatePage(
                            isManage: true, isUpd: true, prod: dataProd),
                        fullscreenDialog: true)!
                    .then((val) async {
                  if (val == true) {
                    await _refreshData(dataProd!.id!);
                  }
                });
              },
              icon: const Icon(Iconsax.edit_2))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding * 2),
        child: Column(
          children: [
            ProductItem(ctg: dataProd!),
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
                          text: "Prix",
                          icon: Icon(Iconsax.money_add),
                        ),
                        Tab(
                          text: "Stocks",
                          icon: Icon(Iconsax.archive_2),
                        ),
                        Tab(
                          text: "Autre",
                          icon: Icon(Iconsax.setting),
                        ),
                      ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: TabBarView(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Historique des prix",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await Get.to(
                                              () =>
                                                  PriceCreate(prod: dataProd!),
                                              fullscreenDialog: true)
                                          ?.then((vl) {
                                        Future.sync(() => prodCtr
                                            .productPricesController
                                            ?.refresh());
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: KStyles.primaryColor,
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        fixedSize: const Size(120, 40)),
                                    child: const Text(
                                      "Ajouter",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 26),
                              Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () => Future.sync(() => prodCtr
                                      .productPricesController
                                      ?.refresh()),
                                  child: LayoutBuilder(
                                    builder: (_, cxs) {
                                      return PagedListView<int,
                                          PricingResponse>.separated(
                                        pagingController:
                                            prodCtr.productPricesController!,
                                        separatorBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 20,
                                              bottom: 10),
                                          child: Divider(
                                              height: 1,
                                              thickness: 1,
                                              color: Colors.grey.shade300),
                                        ),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                PricingResponse>(
                                          itemBuilder: (context, ctg, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: PriceCard(
                                                pricingResponse: ctg,
                                                index: index,
                                              ),
                                            );
                                          },
                                          firstPageProgressIndicatorBuilder:
                                              (_) => const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          newPageProgressIndicatorBuilder:
                                              (_) => const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              _noItem(),
                                          firstPageErrorIndicatorBuilder: (_) =>
                                              PagedFirstError(
                                                  pagingController: prodCtr
                                                      .productPricesController,
                                                  cxs: cxs),
                                          newPageErrorIndicatorBuilder: (_) =>
                                              PagedNewPageError(
                                                  pagingController: prodCtr
                                                      .productPricesController),
                                        ),
                                      );
                                    },
                                  ),
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
}
