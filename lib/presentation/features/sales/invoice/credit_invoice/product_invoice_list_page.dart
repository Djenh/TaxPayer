import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class ProductInvoiceListPage extends StatefulWidget {

  final List<ItemsEntities>? itemsList;
  const ProductInvoiceListPage({super.key, required this.itemsList});

  @override
  State<ProductInvoiceListPage> createState() => _ProductInvoiceListPageState();
}

class _ProductInvoiceListPageState extends State<ProductInvoiceListPage> {

  final prodCtr = locator<ProductCtrl>();
  TextEditingController? searchController;




  String typeProduct(String type){
    return (type == "goods") ? "Biens" : "Services";
  }


  Widget _noItem(){
    return Center(
      child: buildText(context, "Aucun Produit.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }

  Widget _buildProductList(ItemsEntities data) {
    return InkWell(
      onTap: (){
        Get.back(result: data);
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
                        child: buildText(context,
                            typeProduct(data.item!.product!.productType!), 10,
                            KStyles.primaryColor, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 6),
                      buildText(context, data.item?.product?.name ?? "", 14,
                          Colors.black, fontWeight: FontWeight.w600),
                      const SizedBox(height: 6),
                      buildText(context,
                          data.item?.product?.category?.name ?? "", 14,
                          Colors.grey, fontWeight: FontWeight.w400),
                      const SizedBox(height: 6),
                      buildText(context,
                          "Quantité : ${data.item?.quantity ?? 0}", 14,
                          Colors.grey, fontWeight: FontWeight.w400)
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Produit sur la facture originale"),
      body: widget.itemsList!.isEmpty
          ? _noItem()
          : Column(
        children: [
          //const SizedBox(height: 8),
          Expanded(
            child: LayoutBuilder(
              builder: (_, cxs) {
                return ListView.separated(
                    itemBuilder: (BuildContext context, int pd){
                      final item = widget.itemsList![pd];
                      return _buildProductList(item);
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Divider(
                          height: 1, thickness: 1, color: Colors.grey.shade300),
                    ),
                    itemCount: widget.itemsList!.length
                );
              },
            ),
          )
        ],
      ),
    );
  }


}
