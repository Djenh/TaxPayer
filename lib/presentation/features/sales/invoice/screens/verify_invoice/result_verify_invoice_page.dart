import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/services/pdf_generate.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/complaint/screens/complaint_create_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/template_invoice/modern_view_invoice_sifec_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../../../../../_widgets/app_bar_custom.dart';
import '../../../tombola/screens/participate_tombola_page.dart';



class ResultVerifyInvoicePage extends StatefulWidget {

  final InvoiceResponse dataInvoice;
  const ResultVerifyInvoicePage({super.key, required this.dataInvoice});

  @override
  State<ResultVerifyInvoicePage> createState() => _ResultVerifyInvoicePageState();
}

class _ResultVerifyInvoicePageState extends State<ResultVerifyInvoicePage> {

  bool isDanger = false;
  String textDanger = "Cette facture a été entièrement annulée et ne peut en aucun cas être utilisée pour une déduction ou une déclaration.";
  String textDanger1 = "Si vous estimez que cette facture a été annulée de manière frauduleuse malgré le règlement de la transaction commerciale, nous vous invitons vivement à déposer une plainte.";


  Widget _buildDangerContainer(){
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: KStyles.warningInvoice,
          borderRadius: BorderRadius.circular(6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Iconsax.danger, color: KStyles.dangerColor),
              const SizedBox(width: 8),
              buildText(context, "Facture complètement annulée", 16,
                  KStyles.dangerColor1, fontWeight: FontWeight.w700)
            ],
          ),
          const SizedBox(height: 10),
          buildText(context, textDanger, 12, KStyles.dangerColor,
              fontWeight: FontWeight.w400, maxLine: 3),
          const SizedBox(height: 4),
          buildText(context, textDanger1, 12, KStyles.dangerColor,
              fontWeight: FontWeight.w400, maxLine: 4),
        ],
      ),
    );
  }

  Widget _buildBtnComplain(){
    return GestureDetector(
      onTap: () => Get.to(() => const ComplaintCreatePage()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: KStyles.primaryColor,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Iconsax.edit, color: Colors.white, size: 18,),
              const SizedBox(width: 4),
              buildText(context, "Se plaindre", 14, Colors.white, fontWeight: FontWeight.w400)
            ],
          ),
        ),
      )
    );
  }

  Widget _buildBtnTombola(){
    return GestureDetector(
      onTap: (){
        Get.to(() => ParticipateTombolaPage(dataInvoice: widget.dataInvoice));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: KStyles.primaryColor, width: 1.5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Iconsax.gameboy, color: KStyles.primaryColor, size: 18,),
              const SizedBox(width: 4),
              buildText(context, "Participer à la tombola", 14, KStyles.primaryColor, fontWeight: FontWeight.w400)
            ],
          ),
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Vérification de facture", actionList: [
        IconButton(
          onPressed: ()=> GeneratePdfService.generateAndPrintPdf(widget.dataInvoice,true,false,true),
          icon: const Icon(Iconsax.document_download),
        ),
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
         child: Column(
           children: [
             if(widget.dataInvoice.fullyReimbursed != null && widget.dataInvoice.fullyReimbursed!)...[
               _buildDangerContainer(),
               const SizedBox(height: 20),
             ],
             Container(
               padding: const EdgeInsets.all(8),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(6)
               ),
               child: ModernSifecViewInvoicePage(
                   invoiceResponse: widget.dataInvoice, isSaleInvoice: true),
             ),
             const SizedBox(height: 20)
           ],
         ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBtnComplain(),
            const SizedBox(height: 4),
            _buildBtnTombola()
          ],
        ),
      ),
    );
  }


}
