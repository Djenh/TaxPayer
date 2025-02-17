import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/button/kcirclebutton.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/tin_require_check.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/invoice/tin_require_check.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/features/clients/screens/customer_page.dart';
import 'package:invoice_app/presentation/features/pos/screens/invoice_dialog.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/invoice_detail_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/logger_util.dart';
import 'package:invoice_app/utils/utils.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/build_dropdown_str.dart';
import '../../../../_widgets/simple_btn.dart';
import '../security_tax/security_tax_page.dart';
import '../type_invoice/type_invoice_page.dart';
import 'invoice_item_page.dart';



class InvoiceCreatePage extends StatefulWidget {
  const InvoiceCreatePage({super.key});

  @override
  State<InvoiceCreatePage> createState() => _InvoiceCreatePageState();
}

class _InvoiceCreatePageState extends State<InvoiceCreatePage> {

  final invCtr = locator<InvoiceCtrl>();
  TypeInvoiceEntities? dataTypeInvoice;
  String hintTypeInvoice = "Choisir facture";
  DepositTaxEntities? dataTaxDeposit;
  String hintTypeTax = "Choisir...";
  CustomerEntities? dataCustomer;
  Future<InvoiceCheckTinRequire?>? futureCheck;
  TinRequireCheckDto tinRequireCheckDto = TinRequireCheckDto(securityTaxCode: "",clientCode: "");
  String typeCustomer = "Choisir un client";
  InvoiceResponse? invoiceData;
  RxNum tH = RxNum(0);
  RxNum tA = RxNum(0);
  RxNum gT = RxNum(0);

  void _showToast(String description) {
    ToastService.showWarning(context, 'Facturation', description: description);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _updateDataInvoice(InvoiceResponse val){
    invoiceData = val;
    tH.value = val.total!.baseTaxable!;
    tA.value = val.total!.tax!;
    gT.value = val.total!.ttc!;
    setState(() {});
  }

  void _calculationItems() async{
    await invCtr.invoiceCalculation(
        invCtr.addInvoiceDto.value,context: context).then((val){
      if(val != null){
        _updateDataInvoice(val);
      }
    });
  }

  Future<void> _verifyFieldBeforeAddItem() async {

    if (dataTypeInvoice == null) {
      _showToast('Veuillez sélectionner un type de facture');
      return;
    }

    if (dataCustomer == null) {
      _showToast('Veuillez sélectionner un client');
      return;
    }

    AppLogger.info("invoiceDto => ${invCtr.addInvoiceDto.toJson()}");
    invCtr.addInvoiceDto.value.items.clear();
    await Get.to( ()=>const InvoiceItemPage(itemsEntities: null),
        fullscreenDialog: true )!.then((val) async {
      if(val == true){
        invCtr.addInvoiceDto.value.items.addAll(invCtr.finalItemInvoice);
        _calculationItems();
      }
    });
  }

  Widget _buildBtnAddItem(){
    return SimpleBtn(titleBtn: "Ajouter un élément", sizeFont: 12, onPressed:(){
      _verifyFieldBeforeAddItem();
    });
  }

  Widget _noItems(){
    return Column(
      children: [
        Center(
          child: buildText(context, "Aucun élément ne figure sur cette facture", 12,
              Colors.black, fontWeight: FontWeight.w300, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 10),
        _buildBtnAddItem()
      ],
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

  /// items Action
  void _incrementQuantity(int index){
    invCtr.finalItemInvoice[index].quantity +=1;
    _calculationItems();
  }

  void _decrementQuantity(int index) {
    if (invCtr.finalItemInvoice[index].quantity > 1) {
      invCtr.finalItemInvoice[index].quantity -= 1;
      _calculationItems();
    }
  }

  void _removeItem(int index) {
    invCtr.finalItemInvoice.removeAt(index);
    debugPrint("invv => ${invCtr.finalItemInvoice.length}");
    if(invCtr.finalItemInvoice.isNotEmpty){
      invCtr.addInvoiceDto.value.items = invCtr.finalItemInvoice;
      _calculationItems();
    }else{
      invCtr.addInvoiceDto.value.items = [];
      invoiceData = null;
      tH.value = 0;
      tA.value = 0;
      gT.value = 0;
      setState(() {});
    }
  }

  Widget _buildProductRow({
    required int index,
    required String title,
    required String subtitle,
    required int price,
    required int quantity,
    required ItemsEntities item,
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
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () async{
                  invCtr.addInvoiceDto.value.items.clear();
                  await Get.to(() => InvoiceItemPage(itemsEntities: item,index: index),
                      fullscreenDialog: true )!.then((val) async {
                    if(val == true){
                      invCtr.addInvoiceDto.value.items.addAll(invCtr.finalItemInvoice);
                      _calculationItems();
                    }
                  });
                },
                child: const Icon(Iconsax.edit, color: KStyles.primaryColor, size: 20),
              ),
              const SizedBox(width: 20),
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

  Widget _itemServiceProd(){
    return (invoiceData == null)
        ? _noItems()
        :
    Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: invoiceData!.invoice!.items!.length,
          separatorBuilder: (context, index) =>
          const Divider(thickness: 1, height: 1),
          itemBuilder: (context, index){
            final item = invoiceData!.invoice!.items![index];
            return GestureDetector(
              onTap: () async{
                invCtr.addInvoiceDto.value.items.clear();
                await Get.to(() => InvoiceItemPage(itemsEntities: item,index: index),
                    fullscreenDialog: true )!.then((val) async {
                  if(val == true){
                    invCtr.addInvoiceDto.value.items.addAll(invCtr.finalItemInvoice);
                    _calculationItems();
                  }
                });
              },
              child: _buildProductRow(
                index: index,
                title: "",
                subtitle: item.item!.product!.name ?? "",
                price: item.item!.product!.price!.amount!.toInt(),
                quantity: invCtr.finalItemInvoice[index].quantity,
                item: item,
                //quantity: item.item!.quantity!,
              )
            );
          },
        ),
        const Divider(),
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


  ///add invoice
  Future<void> addInvoice() async {
    AppLogger.debug("Final data to save for invoice =>"
        " ${invCtr.addInvoiceDto.value.toJson()}");

    await invCtr.invoiceSetData(context, invCtr.addInvoiceDto.value).then((val){
      if(val != null){
        Get.off(() => InvoiceDetailPage(invoiceResponse: val, isSaleInvoice: true));
      }
    });

  }

  Widget _buildBtnAddInvoice(){
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
                    title: "Créer une facture",
                    loading: invCtr.isLoading,
                    onPressed: (){
                      final currentPos = AppServices.instance.currentPos.value;
                      if(currentPos == null){
                        gotoSelectPos();
                      }else if(currentPos.code!.isEmpty){
                        gotoSelectPos();
                      }else if(invCtr.addInvoiceDto.value.typeInvoiceCode.isEmpty){
                        _showToast('Le code du type de facture est obligatoire');
                      }else if(invCtr.addInvoiceDto.value.items.isEmpty){
                        _showToast('La facture doit contenir au moins un item');
                      }else{
                        invCtr.addInvoiceDto.value.posCode = currentPos.code!;
                        addInvoice();
                      }
                    }),
              ),
              const SizedBox(width: 16),
              /*Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: KStyles.primaryColor),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    // TODO: Action de l'icône
                    debugPrint("Bouton d'option cliqué");
                  },
                  icon: const Icon(Iconsax.more, color: KStyles.primaryColor,
                      size: 20),
                ),
              ),*/
            ],
          ),
        ),
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
    final currentPos = AppServices.instance.currentPos.value;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;

        if (dataTypeInvoice != null) {

          final bool? shouldLeave = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: buildText(context, "Facture non archevé", 16, Colors.black,
                  fontWeight: FontWeight.w600),
              content: const Text("Vous n'avez pas finir de crée votre facture."
                  " Voulez-vous vraiment quitter ?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Rester'),
                ),
                TextButton(
                  onPressed: () {
                    invCtr.cleanInvoiceData();
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Quitter'),
                ),
              ],
            ),
          );
          if (shouldLeave == true) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        }else {
          if (mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context, "Créer une facture", actionList: [
              IconButton(
                onPressed: (){},
                icon: const Icon(Iconsax.document_download),
              )
            ]),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              RichText(textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Edition de facture pour l'agence ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                      ),
                    ),
                    TextSpan(
                      text: ' ${currentPos?.company?.name??""}/ ${currentPos?.company?.tin??""}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: KStyles.primaryColor,
                        fontWeight: FontWeight.w800,
                          fontSize: 14
                      ),
                    ),
                  ],

                ),
              ),
              const SizedBox(height: 30),
              buildText(context, "Facture", 14, Colors.black,
                   fontWeight: FontWeight.w600),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: BuildDropdownString(
                      label: "Type de facture",
                      hint: (dataTypeInvoice != null) ? dataTypeInvoice!.name! : hintTypeInvoice,
                      items: const [],
                      onTap: () async {
                        await Get.to(() => const TypeInvoicePage(),
                            fullscreenDialog: true)?.then((val){
                              if(val is TypeInvoiceEntities){
                                setState(() {
                                  dataTypeInvoice = val;
                                  invCtr.addInvoiceDto.value.typeInvoiceCode = val.code!;
                                });
                              }
                        });
                      }
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: BuildDropdownString(
                      label: "Taxe de sécurité",
                      hint: (dataTaxDeposit != null) ? dataTaxDeposit!.name! : hintTypeTax,
                      items: const [],
                      onTap: () async {
                        await Get.to(() => const SecurityTaxPage(),
                            fullscreenDialog: true)?.then((val) async{
                             if(val is DepositTaxEntities){
                               setState(() {
                                 dataTaxDeposit = val;
                                 tinRequireCheckDto.securityTaxCode =  val.code!;
                                 invCtr.addInvoiceDto.value.securityTaxCode = val.code!;
                               });
                               if(tinRequireCheckDto.clientCode!.isNotEmpty && tinRequireCheckDto.securityTaxCode!.isNotEmpty){
                                 futureCheck =  invCtr.invoiceCheckIfTinIsRequire(context, tinRequireCheckDto);
                               }

                             }
                        });
                      }
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              BuildDropdownString(
                label: "Client concerné",
                hint: (dataCustomer != null) ? dataCustomer!.name! : typeCustomer,
                items: const [],
                onTap: () async {
                  await Get.to(() => const CustomerPage(isManage: false,isInvoice: true),
                      fullscreenDialog: true)?.then((val) async{
                        if(val is CustomerEntities){
                          setState(() {
                            dataCustomer = val;
                            tinRequireCheckDto.clientCode =  val.code!;
                            invCtr.addInvoiceDto.value.clientCode = val.code!;
                          });

                          if(tinRequireCheckDto.clientCode!.isNotEmpty && tinRequireCheckDto.securityTaxCode!.isNotEmpty){
                            futureCheck =  invCtr.invoiceCheckIfTinIsRequire(context, tinRequireCheckDto);
                          }
                        }
                  });
                }
              ),
              const SizedBox(height: 10),
              (tinRequireCheckDto.securityTaxCode!.isNotEmpty && tinRequireCheckDto.clientCode!.isNotEmpty) ?
              Padding(
                  padding: const EdgeInsets.only(top: 5,left: 16, right: 16),
                  child:FutureBuilder<InvoiceCheckTinRequire?>(
                      future: futureCheck,
                      builder: (_, snap) {
                        if (snap.connectionState == ConnectionState.done) {
                          if (snap.hasData) {
                            if (snap.data!.decision != null && snap.data!.decision!) {
                              return Container(
                                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(15),),
                                    color: Colors.red.withOpacity(0.15),
                                  ),
                                  child: Center(
                                    child: Text("Pour appliquer la taxe de sécurité (${tinRequireCheckDto.securityTaxCode??""}) pour le client ${dataCustomer?.name??""}, veuillez ajouter le TIN aux données du client.",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(15),),
                                    color: KStyles.primaryColor.withOpacity(0.15),
                                  ),
                                  child: Text("TIN non requis pour le client ${dataCustomer?.name??""} ",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          } else {
                            return const LinearProgressIndicator(color: KStyles.primaryColor);
                          }
                        }else{
                          return const LinearProgressIndicator(color: KStyles.primaryColor);
                        }
                      })
              ):const Text(""),
              const SizedBox(height: 40),
              buildText(context, "Article/service de la facture", 14, Colors.black,
                  fontWeight: FontWeight.w600),
              const SizedBox(height: 20),
              _itemServiceProd(),
              const SizedBox(height: 40),
              buildText(context, "Repartitions des taxes", 14, Colors.black,
                  fontWeight: FontWeight.w600),
              const SizedBox(height: 20),
              _buildTotalItem()
            ],
          ),
        ),
        bottomNavigationBar: _buildBtnAddInvoice(),
      ),
    );
  }
}
