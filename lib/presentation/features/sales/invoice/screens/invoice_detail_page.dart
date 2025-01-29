import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/template_invoice/modern_view_invoice_1_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/template_invoice/modern_view_invoice_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/widgets/invoice_item.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../widgets/modals/full_menu.dart';



/*class InvoiceDetailPage extends StatelessWidget {
  const InvoiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jean Louis"),
        actions: [
          IconButton(
              onPressed: () {
                showMoreMenu(context);
              },
              icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: ListView(
        children: [
          const KContainer(
            title: "Client",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KtextGray(
                          "Invoice No",
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("#12345784"),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KtextGray(
                          "Date",
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("10/34/23"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KtextGray(
                      "Invoice To",
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("Georges Cress HOUNNOUKON"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Invoice Items",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ListTile.divideTiles(context: context, tiles: [
                const ListTile(
                  title: Text("Lait djado"),
                  subtitle: KtextGray("Qte: Z"),
                  trailing: Text("2000 XOD"),
                  contentPadding: EdgeInsets.zero,
                ),
                const ListTile(
                  title: Text("Lait djado"),
                  subtitle: KtextGray("Qte: Z"),
                  trailing: Text("2000 XOD"),
                  contentPadding: EdgeInsets.zero,
                ),
              ]).toList(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Subtotal",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grand total",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        const Text("Qte: Z"),
                      ],
                    ),
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height*0.60,
          child:  const FullMenu(),
        ));
      },
    );
  }
}*/


class InvoiceDetailPage extends StatefulWidget {
  final InvoiceResponse? invoiceResponse;
  const InvoiceDetailPage({super.key, this.invoiceResponse});

  @override
  State<InvoiceDetailPage> createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends State<InvoiceDetailPage> {
  ScreenshotController screenshotController = ScreenshotController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Fature ${widget.invoiceResponse?.invoice?.code??0}", actionList: [
        IconButton(
          onPressed: generatePdf,
          icon: const Icon(Iconsax.document_download),
        ),
        IconButton(
          onPressed: (){
            showMoreMenu(context);
          },
          icon: const Icon(Icons.more_vert_outlined),
        )
      ]),
      body: Screenshot(
        controller: screenshotController,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ModernViewInvoicePage(isSaleInvoice: true,invoiceResponse: widget.invoiceResponse),
        ),
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
      builder: (context) => FullMenu(invoiceResponse: widget.invoiceResponse,screenshotController: screenshotController),
    );
  }

  Future<void> generatePdf() async{
    try{
      Uint8List? image = await screenshotController.capture();
      if(image == null) return;
      final pdf = pw.Document();
      final imageProvider = pw.MemoryImage(image);

      pdf.addPage(
        pw.Page(
          build: (pw.Context context){
            return pw.Center(child: pw.Image(imageProvider));
          }
        )
      );
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${widget.invoiceResponse?.invoice?.typeInvoice?.name??""}_${widget.invoiceResponse?.invoice?.code??""}.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());
      if (kDebugMode) {
        print("PDF genere avec succes");
      }

      await OpenFilex.open(filePath);
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
    }
  }

}