import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/services/pdf_generate.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/template_invoice/modern_view_invoice_page.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../widgets/modals/full_menu.dart';


class InvoiceDetailPage extends StatefulWidget {
  final InvoiceResponse? invoiceResponse;
  final bool isSaleInvoice;

  const InvoiceDetailPage({super.key, this.invoiceResponse,
    required this.isSaleInvoice});

  @override
  State<InvoiceDetailPage> createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends State<InvoiceDetailPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context,
          "Fature ${widget.invoiceResponse?.invoice?.code??0}",
          actionList: [
        IconButton(
          onPressed: ()=> GeneratePdfService.generateAndPrintPdf(widget.invoiceResponse!,widget.isSaleInvoice,false,false),
          icon: const Icon(Iconsax.document_download),
        ),
        IconButton(
          onPressed: (){
            showMoreMenu(context);
          },
          icon: const Icon(Icons.more_vert_outlined),
        )
      ]
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ModernViewInvoicePage(isSaleInvoice: widget.isSaleInvoice,
            invoiceResponse: widget.invoiceResponse),
      ),
    );
  }


  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => FullMenu(invoiceResponse: widget.invoiceResponse,
          isSaleInvoice: widget.isSaleInvoice),
    );
  }
}