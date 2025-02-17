import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/button/kcirclebutton.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/add_invoice_dto.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/simple_btn.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/features/sales/invoice/credit_invoice/product_invoice_list_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/invoice_detail_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/logger_util.dart';
import 'package:invoice_app/utils/utils.dart';

class CreditInvoicePage extends StatefulWidget {
  final InvoiceResponse? dataInvoice;

  const CreditInvoicePage({super.key, required this.dataInvoice});

  @override
  State<CreditInvoicePage> createState() => _CreditInvoicePageState();
}

class _CreditInvoicePageState extends State<CreditInvoicePage> {

  final invCtr = locator<InvoiceCtrl>();
  RxNum tH = RxNum(0);
  RxNum tA = RxNum(0);
  RxNum gT = RxNum(0);
  InvoiceResponse? invoiceRemData;




  Widget _buildRefInvoice(){
    return GestureDetector(
      onTap: (){
        Get.off(() => InvoiceDetailPage(invoiceResponse: widget.dataInvoice, isSaleInvoice: true));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(context, "Ref de la facture originale :", 14, Colors.black,
              fontWeight: FontWeight.w500),
          const SizedBox(width: 20),
          Expanded(
            child: buildText(context, widget.dataInvoice?.invoice?.code ?? "", 12,
                KStyles.dcardBusinessColor, fontWeight: FontWeight.w600,
                maxLine: 3
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnCustom(String title, String desc){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(context, title, 14, Colors.black),
        const SizedBox(height: 6),
        buildText(context, desc, 12, Colors.black, fontWeight: FontWeight.w600)
      ],
    );
  }

  Widget _buildInfoInvoice(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Iconsax.user, color: Colors.black),
        _buildColumnCustom("Facture adressée à:",
            widget.dataInvoice?.invoice?.client?.name ?? ""),
        _buildColumnCustom("Taxe de sécurité",
            "${widget.dataInvoice?.invoice?.securityTax?.rate?.toInt() ?? ""}%"),
      ],
    );
  }


  Widget _buildProductRow({
    required int index,
    required String title,
    required String subtitle,
    required int price,
    required int quantity,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(context, title, 14, Colors.black54,
              fontWeight: FontWeight.w400),
          Row(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: KStyles.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: buildText(
                      context, subtitle.toUpperCase(), 12, KStyles.primaryColor,
                      fontWeight: FontWeight.w400,maxLine: 3),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _removeItem(index),
                child: const Icon(Iconsax.trash, color: Colors.redAccent, size: 20),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  KCircleButton(
                    color: Colors.transparent,
                    onPressed: () => _decrementQuantity(index),
                    child: const Icon(Icons.remove,color: KStyles.primaryColor, size: 25),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    //width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "$quantity",
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(width: 5),
                  KCircleButton(
                    color: Colors.transparent,
                    onPressed: () => _incrementQuantity(index),
                    child: const Icon(Icons.add,color: KStyles.primaryColor, size: 25),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Flexible(
                child: buildText(context, "${Utils.getFormattedAmount(price * quantity)} Fcfa", 12, Colors.black,
                    fontWeight: FontWeight.w800),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _itemProd(){
    return (invoiceRemData == null)
        ? _noItems()
        : Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: invoiceRemData!.invoice!.items!.length,
          separatorBuilder: (context, index) =>
          const Divider(thickness: 1, height: 1),
          itemBuilder: (context, it){
            final item = invoiceRemData!.invoice!.items![it];

            return _buildProductRow(
              index: it,
              title: '',
              subtitle: item.item?.product?.name ?? "",
              price: item.item!.product!.price!.amount!.toInt(),
              quantity: invCtr.finalItemInvoiceReimbursement[it].quantity,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: _buildBtnAddItem()
          ),
        )
      ],
    );
  }

  Widget _noItems(){
    return Column(
      children: [
        Center(
          child: buildText(context, "Aucun élément ne figure sur cette facture",
              12, Colors.black, fontWeight: FontWeight.w300,
              textAlign: TextAlign.center),
        ),
        const SizedBox(height: 10),
        _buildBtnAddItem()
      ],
    );
  }


  Widget _buildBtnAddItem(){
    return SimpleBtn(titleBtn: "Sélectionnez l'élément à rembourser",
        sizeFont: 12, onPressed:() async {
           int presentItemAdd = invCtr.finalItemInvoiceReimbursement.length;
           int originalItem = widget.dataInvoice!.invoice!.items!.length;

          if(presentItemAdd < originalItem){
            await Get.to(() => ProductInvoiceListPage(
                itemsList: widget.dataInvoice?.invoice?.items ?? [],dataInvoice: widget.dataInvoice),
                fullscreenDialog: true
            )!.then((val){
              if(val is ItemsEntities){
                reiItemCalculate(val);
              }
            });
          }else{
            ToastService.showWarning(context, "Facture d'avoir", description:
            "Impossible de sélectionner un autre élément à rembourser,"
              " car sur la facture originale vous avez $originalItem produits");
          }
        }
    );
  }

  Widget _buildTotalItem(){
    return Obx(() => Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(bottom: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Total Hors Taxes (Total HT)",
                  14, Colors.black, fontWeight: FontWeight.w300),
              buildText(context, "${Utils.getFormattedAmount(tH.value)} Fcfa", 14, Colors.black,
                  fontWeight: FontWeight.w300),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(bottom: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Total appliquées",
                  14, Colors.black, fontWeight: FontWeight.w300),
              buildText(context, "${Utils.getFormattedAmount(tA.value)} Fcfa", 14,
                  Colors.black, fontWeight: FontWeight.w300),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildText(context, "Grand total",
                14, Colors.black, fontWeight: FontWeight.w600),
            buildText(context, "${Utils.getFormattedAmount(gT.value)} Fcfa", 14, Colors.black,
                fontWeight: FontWeight.w300),
          ],
        ),
      ],
    ));
  }


  Future<void> reiItemCalculate(ItemsEntities it) async {
    invCtr.addInvoiceReiDto.value.originalInvoiceCode =
        widget.dataInvoice?.invoice?.code ?? "";

    invCtr.finalItemInvoiceReimbursement.add(ItemInvoiceDto(
        quantity: it.item?.quantity ?? 0,
        productCode: it.item?.product?.code ?? ""));


    invCtr.addInvoiceReiDto.value.items.clear();
    invCtr.addInvoiceReiDto.value.items.addAll(
        invCtr.finalItemInvoiceReimbursement);

    _calculationItems();
  }

  void _updateDataInvoice(InvoiceResponse val){
    invoiceRemData = val;
    tH.value = val.total!.baseTaxable!;
    tA.value = val.total!.tax!;
    gT.value = val.total!.ttc!;
    setState(() {});
  }

  void _calculationItems() async{
    await invCtr.invoiceCalculationReimbursement(context,
        invCtr.addInvoiceReiDto.value).then((val){
      if(val != null){
        _updateDataInvoice(val);
      }
    });
  }


  /// items Action
  void _incrementQuantity(int index){
    invCtr.finalItemInvoiceReimbursement[index].quantity +=1;
    _calculationItems();
  }

  void _decrementQuantity(int index) {
    if (invCtr.finalItemInvoiceReimbursement[index].quantity > 1) {
      invCtr.finalItemInvoiceReimbursement[index].quantity -= 1;
      _calculationItems();
    }
  }

  void _removeItem(int index) {
    invCtr.finalItemInvoiceReimbursement.removeAt(index);
    if(invCtr.finalItemInvoiceReimbursement.isNotEmpty){
      invCtr.addInvoiceReiDto.value.items = invCtr.finalItemInvoice;
      _calculationItems();
    }else{
      invCtr.addInvoiceDto.value.items = [];
      invoiceRemData = null;
      tH.value = 0;
      tA.value = 0;
      gT.value = 0;
      setState(() {});
    }

  }


  //create credit invoice
  Widget _buildBtnAddCreditInvoice(){
    return Container(
      height: 100,
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ActionBtn(
                    title: "Enregistrer la facture",
                    loading: invCtr.isLoading,
                    onPressed: (){
                      addCreditInvoice();
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addCreditInvoice() async {
    AppLogger.debug("Final data to save for credit invoice =>"
        " ${invCtr.addInvoiceReiDto.value.toJson()}");

    await invCtr.invoiceCreditSetData(context, invCtr.addInvoiceReiDto.value).then((val){
      if(val != null){
        Get.off(() => InvoiceDetailPage(invoiceResponse: val, isSaleInvoice: false));
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Facture d'avoir"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRefInvoice(),
            const SizedBox(height: 30),
            _buildInfoInvoice(),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 20),
            buildText(context, "Produits/service de la facture", 14, Colors.black,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 30),
            _itemProd(),
            const SizedBox(height: 40),
            buildText(context, "Repartitions des taxes", 14, Colors.black,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 20),
           _buildTotalItem()
          ],
        ),
      ),
      bottomNavigationBar: _buildBtnAddCreditInvoice(),
    );
  }


}
