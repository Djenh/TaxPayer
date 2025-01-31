import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/commons/ui/kagencycard.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/features/registration/_strings/register_str.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/invoice_create_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/invoice_detail_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/widgets/invoice_item.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class AgencyDetailPage extends StatefulWidget {
  final PosDataResponse dataAgency;
  const AgencyDetailPage({super.key,required this.dataAgency});

  @override
  State<AgencyDetailPage> createState() => _AgencyDetailPageState();
}

class _AgencyDetailPageState extends State<AgencyDetailPage> {

  final invoiceCtr = locator<InvoiceCtrl>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceCtr.pagingIvoiceController = PagingController<int, InvoiceResponse>(firstPageKey: 0);
    invoiceCtr.pagingIvoiceController.addPageRequestListener((pageKey) {
      invoiceCtr.allInvoiceData(widget.dataAgency.company?.tin??"",pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    invoiceCtr.pagingIvoiceController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor : Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.2),
          leading:
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  );
                },
              ),
            ],
          ),
          title: Text("Agence N° ${widget.dataAgency.code??""}",
                style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 17,)
            ),
          actions: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: KStyles.secondaryColor.withOpacity(0.2),
                foregroundColor: KStyles.secondaryColor,
                side: const BorderSide(color: KStyles.secondaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:  Text(widget.dataAgency.company?.status??"", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),),
            ),
            const SizedBox(width: padding),
          ]
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => invoiceCtr.pagingIvoiceController.refresh()),
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: padding15,right: padding15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: padding15),
                  Container(
                    width: (MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: KStyles.dropDownBorderColor)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: cardWiget("Agence N°1\n",widget.dataAgency.address?.description??"")),
                                const SizedBox(width: padding),
                                Expanded(child: cardWiget("1.200.000\n","Chiffre d'affaire")),
                              ],
                            ),
                          ),
                          const SizedBox(height: padding,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: textWiget(widget.dataAgency.contact?.email??"",Iconsax.sms)),
                              const SizedBox(width: padding15),
                              Flexible(child: textWiget(widget.dataAgency.contact?.phoneNumber??"",Iconsax.call)),
                            ],
                          ),
                          const SizedBox(height: padding),
                          textWiget(widget.dataAgency.address?.description??"",Iconsax.map),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: padding15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Point des affaires", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                            Text("Situation sur les 6 derniers mois", style: TextStyle(fontSize: 12),),
                          ],
                        ),
                      ),
                      const SizedBox(width: padding),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: KStyles.dropDownBorderColor)
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(padding5),
                              child: Row(
                                children: [
                                  Icon(Icons.filter_alt_outlined, color: KStyles.blackColor, size: 20),
                                  SizedBox(
                                    width: padding5,
                                  ),
                                  Text("Semestre dernier",style: TextStyle(color: KStyles.blackColor,fontSize: 12)),
                                  SizedBox(
                                    width: padding5,
                                  ),
                                  Icon(Icons.keyboard_arrow_down, color: KStyles.blackColor, size: 20)
                                ],
                              )
                          ),
                        ),
                      ),
                    ],

                  ),
                  const SizedBox(height: padding15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: KAgencycard(
                          title: "Factures",
                          subTitle: "14",
                          onPressed: (){

                          },
                          borderColor: KStyles.primaryColor,
                          icon: Iconsax.wallet,
                        ),
                      ),
                      const SizedBox(
                        width: padding,
                      ),
                      Flexible(
                        child: KAgencycard(
                          title: "Recettes",
                          subTitle: "200 FCFA",
                          onPressed: (){

                          },
                          borderColor: KStyles.secondaryColor,
                          icon: Iconsax.bill,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: padding15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Les factures",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      OutlinedButton(
                        onPressed: () => Get.to(() => const InvoiceCreatePage()),
                        style: OutlinedButton.styleFrom(
                          foregroundColor:  KStyles.dropDownBorderColor,
                          side: const BorderSide(color:  KStyles.dropDownBorderColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(RegisterStr.createAgency,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color:  KStyles.tabColor)),
                      ),
                    ],
                  ),
                  const SizedBox(height: padding15),
                  LayoutBuilder(
                    builder: (_, cxs) {
                      return PagedListView<int, InvoiceResponse>.separated(
                        pagingController: invoiceCtr.pagingIvoiceController,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: Divider(
                              height: 1, thickness: 1, color: Colors.grey.shade300),
                        ),
                        builderDelegate: PagedChildBuilderDelegate<InvoiceResponse>(
                          itemBuilder: (context, typ, index) {
                            return InvoiceItem(
                              invoiceResponse: typ,
                              onTap: () => Get.to(() =>  InvoiceDetailPage(invoiceResponse: typ)),
                            );
                          },
                          firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                          newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                          noItemsFoundIndicatorBuilder: (_) => noItem(),
                          firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: invoiceCtr.pagingIvoiceController, cxs: cxs),
                          newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: invoiceCtr.pagingIvoiceController),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
  Widget noItem(){
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Center(
        child: buildText(context, "Aucune facture trouvée.", 16, Colors.black,
            fontWeight: FontWeight.w500, textAlign: TextAlign.center),
      ),
    );
  }
  Widget cardWiget(String title, subTitle){
    return Container(
        width: 150,
        decoration: BoxDecoration(
            color: KStyles.bgStatColor,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text.rich(
            TextSpan(
                text: title,
                style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 14,),
                children: <TextSpan>[
                  TextSpan(text: subTitle,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                  )
                ]
            ),
          ),
        )
    );
  }
  Widget textWiget(String title, IconData icon){
    return Row(
      children: [
        Icon(icon, size:18, color: KStyles.textSecondaryColor),
        const SizedBox(width: padding5),
        Flexible(child: Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black)))
      ],
    );
  }

}
