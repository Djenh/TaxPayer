import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/app_loader.dart';
import 'dart:io';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';


class GeneratePdfService {
  static void exportInvoiceToPdf(BuildContext context,ScreenshotController screenshotController,InvoiceResponse invoiceResponse) async{
    AppLoaderDialog.show(Get.context!);
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
      final filePath = '${directory.path}/${invoiceResponse.invoice?.typeInvoice?.name??""}_${invoiceResponse.invoice?.code??""}.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());
      if (kDebugMode) {
        print("PDF genere avec succes");
      }
      AppLoaderDialog.dismiss(Get.context!);
      await OpenFilex.open(filePath);
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      AppLoaderDialog.dismiss(Get.context!);
    }

  }
}
