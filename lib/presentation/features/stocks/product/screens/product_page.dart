import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/float_btn.dart';
import 'package:invoice_app/presentation/features/stocks/product/pricing/price_create.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_create_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../../core/configs/injection_container.dart';
import '../../../../../domain/entities/product/product_response.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/paged_first_error.dart';
import '../../../../_widgets/paged_new_page_error.dart';
import '../../../../_widgets/simple_btn.dart';
import '../../../../controllers/product_ctrl.dart';
import '../../../../res/app_input_styles.dart';




class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final prodCtr = locator<ProductCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    prodCtr.pagingProdController = PagingController<int, ProductResponse>(firstPageKey: 0);
    prodCtr.pagingProdController?.addPageRequestListener((pageKey) {
      prodCtr.allProductData(pageKey);
    });

    searchController = TextEditingController();
    searchController?.addListener(() {
      prodCtr.searchProduct(searchController!.text);
    });
  }


  @override
  void dispose() {
    super.dispose();
    prodCtr.pagingCtgController?.dispose();
    prodCtr.pagingCtgController = null;
    searchController?.dispose();
  }


  String typeProduct(String type){
    return (type == "goods") ? "Biens" : "Services";
  }


  void addPrinceInfo(ProductResponse dataProd){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: buildText(context, "Produit", 16, Colors.black,
            fontWeight: FontWeight.w600),
        content: Text("Votre produit ${dataProd.name} ne dispose pas encore de prix."
            " Voulez-vous en ajouter ?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('NON'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
              await Get.to(() => PriceCreate(prod: dataProd),
                  fullscreenDialog: true)?.then((vl){
                Future.sync(() => prodCtr.pagingProdController?.refresh());
              });
            },
            child: const Text('OUI'),
          ),
        ],
      ),
    );
  }


  Widget _buildProductList(ProductResponse ctg) {
    return InkWell(
      onTap: (){
        if(widget.isManage){
          //Get.to(() => const ProductDetailPage());
        }else{
          if(ctg.price != null){
            Get.back(result: ctg);
          } else {
            addPrinceInfo(ctg);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 110,
                    width: 90,
                    decoration: BoxDecoration(
                        color: KStyles.textLightColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(padding)),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: KStyles.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(4),
                        //child: buildText(context, "${typeProduct(ctg.productType!)}/${ctg.category!.name}", 10,
                        child: buildText(context, typeProduct(ctg.productType!), 10,
                            KStyles.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 4),
                      buildText(context, ctg.name!, 14,
                          Colors.black, fontWeight: FontWeight.w600),
                     /* const SizedBox(height: 6),
                      buildText(context, prod["desc"]!, 14,
                          Colors.grey, fontWeight: FontWeight.w400),
                      const SizedBox(height: 4),
                      buildText(context, prod["stk"]!, 14,
                          Colors.grey, fontWeight: FontWeight.w400)*/
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: padding),
            const Column(
              children: [
                Icon(Iconsax.box, color: Colors.grey),
                SizedBox(height: padding),
                Text("9/20"),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _noItem(){
    return (searchController!.text.isNotEmpty)
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Iconsax.document_text, color: KStyles.icColors, size: 64),
        const SizedBox(height: 10),
        buildText(context, "Aucun résultat", 18, Colors.black,
            fontWeight: FontWeight.w400),
        const SizedBox(height: 10),
        buildText(context, "Il n'existe aucun produit portant ce nom.",
            12, Colors.black, fontWeight: FontWeight.w300,
            textAlign: TextAlign.center),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width/2+50,
          child: SimpleBtn(
            titleBtn: "Créer un produit",
            sizeFont: 14,
            onPressed: () async {
              await Get.to(() => ProductCreatePage(isManage: widget.isManage),
                  fullscreenDialog: true)?.then((val){
                if(val == true){
                  prodCtr.pagingProdController?.refresh();
                }
              });
            },
          ),
        )
      ],
    )
        : Center(
      child: buildText(context, "Aucun Produit disponible.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, widget.isManage
          ? "Produits"
          : "Sélectionner un produit"),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() => prodCtr.pagingProdController?.refresh()),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  decoration: AppInputStyles.searchInput("Rechercher un produit"),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, cxs) {
                    return PagedListView<int, ProductResponse>.separated(
                      pagingController: prodCtr.pagingProdController!,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(
                            height: 1, thickness: 1, color: Colors.grey.shade300),
                      ),
                      builderDelegate: PagedChildBuilderDelegate<ProductResponse>(
                        itemBuilder: (context, ctg, index) {
                          return _buildProductList(ctg);
                        },
                        firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        noItemsFoundIndicatorBuilder: (_) => _noItem(),
                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: prodCtr.pagingProdController, cxs: cxs),
                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: prodCtr.pagingProdController),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: widget.isManage
            ? FloatBtn(
          onAction: () async {
            await Get.to(() => ProductCreatePage(isManage: widget.isManage),
                fullscreenDialog: true)?.then((val){
              if(val == true){
                prodCtr.pagingProdController?.refresh();
              }
            });
          },
          icn: Iconsax.add,
        )
            : null,
    );
  }

}
