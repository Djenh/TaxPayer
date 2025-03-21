import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/add_invoice_dto.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/features/pos/screens/invoice_dialog.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_page.dart';
import 'package:invoice_app/utils/logger_util.dart';
import 'package:invoice_app/utils/utils.dart';
import '../../../../../domain/entities/product/product_response.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/build_dropdown_str.dart';
import '../../../../_widgets/simple_btn.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/input_formaters.dart';


class InvoiceItemPage extends StatefulWidget {
  final ItemsEntities? itemsEntities;
  final int? index;
  const InvoiceItemPage({super.key,this.itemsEntities,this.index});

  @override
  State<InvoiceItemPage> createState() => _InvoiceItemPageState();
}


class _InvoiceItemPageState extends State<InvoiceItemPage> {

  final invCtr = locator<InvoiceCtrl>();
  ProductResponse? dataProductSelect;
  String hintProductSelect = "Selectionner";
  TextEditingController? qteController;
  TextEditingController? priceController;
  TaxGroupEntities? dataTaxGroup;
  String hintTypeTax = "Selectionner une taxe";
  TextEditingController? additionalTaxController;
  RxNum tH = RxNum(0);
  RxNum tA = RxNum(0);
  RxNum gT = RxNum(0);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    additionalTaxController = TextEditingController();
    qteController = TextEditingController();
    priceController = TextEditingController();
    if(widget.itemsEntities != null){
      setData();
    }

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    additionalTaxController?.dispose();
    qteController?.dispose();
    priceController?.dispose();
  }

  Future<void> setData() async{
    final currentPos = AppServices.instance.currentPos.value;
    invCtr.addInvoiceDto.value.posCode = currentPos!.code!;
    invCtr.addInvoiceDto.value.items
        .add(ItemInvoiceDto(quantity: widget.itemsEntities?.item?.quantity??1,
        productCode: widget.itemsEntities?.item?.product?.code??""));
    setState(() {
      qteController!.text = widget.itemsEntities!.item!.quantity!.toString();
      priceController!.text =
          widget.itemsEntities?.item?.product?.price?.amount.toString() ?? "";
      dataTaxGroup = widget.itemsEntities?.item?.product?.price?.taxGroup;
      additionalTaxController!.text =
          widget.itemsEntities?.item?.product?.price?.taxSpecific.toString() ?? "";

      dataProductSelect = ProductResponse(
        id: widget.itemsEntities!.item!.product!.id,
        name: widget.itemsEntities!.item!.product!.name,
        officialProductNo: widget.itemsEntities!.item!.product!.officialProductNo,
        code: widget.itemsEntities!.item!.product!.code,
        category: widget.itemsEntities!.item!.product!.category,
        companyTin: widget.itemsEntities!.item!.product!.companyTin,
        price: PricingResponse(
          id: widget.itemsEntities!.item!.product!.price!.id,
          amount: widget.itemsEntities!.item!.product!.price!.amount,
          taxGroup: widget.itemsEntities!.item!.product!.price!.taxGroup,
          taxSpecific: widget.itemsEntities!.item!.product!.price!.taxSpecific,
          createdAt: widget.itemsEntities!.item!.product!.price!.createdAt.toString(),
          updatedAt: widget.itemsEntities!.item!.product!.price!.updatedAt.toString(),
          subTotal: widget.itemsEntities!.item!.product!.price!.subTotal,
          priceDefinitionMode: widget.itemsEntities!.item!.product!.price!.priceDefinitionMode,
          enabled: widget.itemsEntities!.item!.product!.price!.enabled
        ),
        posCode: widget.itemsEntities!.item!.product!.posCode,
        productType:widget.itemsEntities!.item!.product!.productType
      );
    });
    if(dataProductSelect != null){
      AppLogger.info("invoiceDto => ${invCtr.addInvoiceDto.toJson()}");
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        await invCtr.invoiceCalculation(invCtr.addInvoiceDto.value,context: context).then((val){
          if(val != null){
            tH.value = val.total!.baseTaxable!;
            tA.value = val.total!.tax!;
            gT.value = val.total!.ttc!;
            setState(() {});
          }
        });
      });
    }

  }
  Widget padChild({required Widget child}){
    return Padding(
      padding: const EdgeInsets.all(4.0).copyWith(bottom: 15, top: 15),
      child: child,
    );
  }


  Widget _buildItemDetail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padChild(child: buildText(context, "Item Detail", 14, Colors.black,
            fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        BuildDropdownString(
            label: "Produit",
            hint: (dataProductSelect != null) ? dataProductSelect!.name! : hintProductSelect,
            items: const [],
            onTap: () async {
              if(widget.itemsEntities != null){

              }else{
                await Get.to(() => const ProductPage(isManage: false),
                    fullscreenDialog: true)?.then((val) async{
                  if(val is ProductResponse){
                    setState(() {
                      dataProductSelect = val;
                      priceController!.text =
                          val.price?.amount.toString() ?? "";
                      dataTaxGroup = val.price!.taxGroup;
                      additionalTaxController!.text =
                          val.price?.taxSpecific.toString() ?? "";
                    });
                  }
                });
              }
            }
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: qteController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                inputFormatters: noSpaceNoEmoji,
                onFieldSubmitted: (_) async {

                  if(widget.itemsEntities != null){
                    invCtr.addInvoiceDto.value.items.first = ItemInvoiceDto(quantity: int.parse(_),
                        productCode: dataProductSelect!.code!);
                  }else{
                    final currentPos = AppServices.instance.currentPos.value;
                    invCtr.addInvoiceDto.value.posCode = currentPos!.code!;
                    invCtr.addInvoiceDto.value.items
                        .add(ItemInvoiceDto(quantity: int.parse(_),
                        productCode: dataProductSelect!.code!));
                  }

                  AppLogger.info("invoiceDto => ${invCtr.addInvoiceDto.toJson()}");
                  await invCtr.invoiceCalculation(
                      invCtr.addInvoiceDto.value,context: context).then((val){
                    if(val != null){
                      tH.value = val.total!.baseTaxable!;
                      tA.value = val.total!.tax!;
                      gT.value = val.total!.ttc!;
                      setState(() {});
                    }
                  });
                },
                decoration: AppInputStyles.defaultInputDecoration(labelText: "Quantité"),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: priceController,
                enabled: true,
                readOnly: true,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                inputFormatters: noSpaceNoEmoji,
                decoration: AppInputStyles.defaultInputDecoration(labelText: "Prix"),
              ),
            ),
          ],
        )
      ],
    );
  }


  Widget _buildAdditionalTax(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padChild(child: buildText(context, "Taxe description", 14, Colors.black,
            fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        BuildDropdownString(
            label: "Groupe de taxation",
            hint: (dataTaxGroup != null) ? dataTaxGroup!.name! : hintTypeTax,
            items: const [],
            onTap: () {  },
            /*onTap: () async {
              await Get.to(() => const TaxGroupPage(),
                  fullscreenDialog: true)?.then((val){
                  if(val is TaxGroupEntities){
                    setState(() {
                      dataTaxGroup = val;
                    });
                  }
              });
            }*/
        ),
        const SizedBox(height: 20),
        buildText(context, "Tax specifique", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: 10),
        TextFormField(
          controller: additionalTaxController,
          enabled: true,
          readOnly: true,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        )
      ],
    );
  }


  Widget _buildAmountContainer(){
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padChild(child: buildText(context, "Repartition de la taxe", 14, Colors.black,
            fontWeight: FontWeight.w600)),
        padChild(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Total Hors Taxe",
                  14, Colors.black, fontWeight: FontWeight.w300),
              buildText(context, Utils.getFormattedAmount(tH.value), 14, Colors.black,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
        padChild(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Total appliquées",
                  14, Colors.black, fontWeight: FontWeight.w300),
              buildText(context, Utils.getFormattedAmount(tA.value), 14,
                  Colors.black, fontWeight: FontWeight.w600),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
        padChild(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Grand total",
                  14, Colors.black, fontWeight: FontWeight.w600),
              buildText(context, Utils.getFormattedAmount(gT.value), 14, Colors.black,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ],
    ));
  }


  Widget _buildBtnAction(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: SimpleBtn(
            titleBtn: "Ajouter",
            sizeFont: 12,
            onPressed:(){
              final currentPos = AppServices.instance.currentPos.value;
              if(currentPos == null){
                gotoSelectPos();
              }else if(currentPos.code!.isEmpty){
                gotoSelectPos();
              }else{
                if(dataProductSelect != null && qteController!.text.isNotEmpty){
                  if(widget.itemsEntities != null){
                    invCtr.finalItemInvoice[widget.index!] = invCtr.addInvoiceDto.value.items.first;
                    invCtr.addInvoiceDto.value.items.clear();
                    Get.back(result: true);
                  }else{
                    invCtr.addInvoiceDto.value.posCode = currentPos.code!;
                    invCtr.finalItemInvoice.add(invCtr.addInvoiceDto.value.items.first);
                    invCtr.addInvoiceDto.value.items.clear();
                    Get.back(result: true);
                  }

                }else{
                  ToastService.showWarning(context, "Facturation",
                      description: "Selectionner un produit et sa quantité pour ajouté.");
                }
              }

            }),
      ),
    );
  }

  gotoSelectPos(){
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'FullScreenDialog',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return const PosDialogScreen(goBack: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Ajouter un item"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemDetail(),
            const SizedBox(height: 20),
            _buildAdditionalTax(),
            const SizedBox(height: 20),
            _buildAmountContainer()
          ],
        ),
      ),
      bottomNavigationBar: _buildBtnAction(),
    );
  }


}
