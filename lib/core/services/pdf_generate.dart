import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/app_loader.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/_widgets/invoice_pw_widget.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/utils.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class GeneratePdfService {
  static Future<void> generateAndPrintPdf(InvoiceResponse invoiceResponse,bool isSaleInvoice,bool isShared,isSifecModel,{bool? isMailSent,isDownload}) async {
    AppLoaderDialog.show(Get.context!);
    final img = await rootBundle.load('assets/images/user_tag.png');
    final imageBytes = img.buffer.asUint8List();

    final pwImage = pw.MemoryImage(imageBytes);
    final pdf = pw.Document();

    pdf.addPage(

      pw.MultiPage(
        build: (pw.Context context) => [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                child: buildPwCompanyInfoCard(
                    false,
                    invoiceResponse.invoice?.pos?.company?.tin??"",
                    invoiceResponse.invoice?.pos?.company?.name??"",
                    invoiceResponse.invoice?.pos?.contact?.email??"",
                    invoiceResponse.invoice?.pos?.contact?.phoneNumber??"",
                    invoiceResponse.invoice?.pos?.company?.address?.description??"",
                    invoiceResponse.invoice?.pos?.company?.tradeNo??"",pwImage),
              ),
              pw.SizedBox(width: 10),
              pw.Expanded(
                child: buildPwCompanyInfoCard(
                    true,
                    invoiceResponse.invoice?.client?.tin??"",
                    invoiceResponse.invoice?.client?.name??"",
                    invoiceResponse.invoice?.client?.contact?.email??"",
                    invoiceResponse.invoice?.client?.contact?.phoneNumber??"",
                    invoiceResponse.invoice?.client?.invoicingAddress?.description??"",
                    "",pwImage),
              ),
            ],
          ),

          if (!isSaleInvoice) ...[
            pw.SizedBox(height: 10),
            buildReferenceCreditInvoice(
                "Référence de facture originale", "#8003794792943927"),
          ],
          pw.SizedBox(height: 15),
          pw.Center(
              child: buildTitleInvoice(invoiceResponse.invoice?.typeInvoice?.name??"",
                  "N° ${isSifecModel?invoiceResponse.invoice?.externalInvoiceNo??"" :invoiceResponse.invoice?.code??""}")),
          pw.SizedBox(height: 15),
          buildInvoiceItems(invoiceResponse.invoice?.items,isSifecModel),
          pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 8.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                buildPwText("TOTAL", 14,PdfColors.black),
                buildPwText("*${Utils.getFormattedAmount(invoiceResponse.total?.ttc??0)}", 14,PdfColors.black),
              ],
            ),
          ),
          pw.SizedBox(height: 04),
          buildPwText("Répartition des taxes".toUpperCase(), 10, convertFlutterColorToPdfColor(KStyles.primaryColor)),
          pw.SizedBox(height: 04),
          ...?invoiceResponse.taxBreakDown?.map((e) {
            return pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 8.0),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      buildPwText(e.taxGroup?.name ?? "Taxe inconnue", 14, PdfColors.black),
                      buildPwText("*${(e.total ?? 0.0).toStringAsFixed(2)}", 14, PdfColors.black), // Format as currency
                    ],
                  ),
                  pw.SizedBox(height: 4),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      buildPwText("${e.taxGroup?.code ?? ""} (${(e.taxGroup?.rate ?? 0.0).toStringAsFixed(2)}%)", 12, PdfColors.black), // Format percentage
                      buildPwText("", 13, PdfColors.black),
                    ],
                  ),
                  pw.SizedBox(height: 3),
                  DottedDashedLine(),
                ],
              ),
            );
          }),
          pw.SizedBox(height: 10),
          pw.Container(
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
                borderRadius: pw.BorderRadius.circular(6),
                border: pw.Border.all(color: convertFlutterColorToPdfColor(KStyles.fieldGrey))),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                    child: buildQrCode(invoiceResponse.signatureData?.qrCode?.toString() ?? '')
                ),
                pw.Expanded(
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        buildPwText("Signature", 8,PdfColors.black),
                        pw.SizedBox(height: 4),
                        buildPwText("${invoiceResponse.signatureData?.signature?.toString()}", 8,PdfColors.black),
                        pw.SizedBox(height: 4),
                        buildRowDataSign("TIN-POS-TI", "1230909-0834"),
                        pw.SizedBox(height: 4),
                        buildRowDataSign("Ref logiciel", "9LEHE"),
                        pw.SizedBox(height: 4),
                        buildRowDataSign("Date, Heure", invoiceResponse.signatureData?.certifiedDate?.toString()??"")
                      ],
                    ))
              ],
            ),
          ),
          pw.SizedBox(height: 8),
          buildPwText("Arrêté la présente facture à la somme"
              " de ${invoiceResponse.totalInletters?.toString()??""}",
              10,
              PdfColors.black,maxLine: 2),
          pw.SizedBox(height: 100),
        ],
      ),
    );
    final now = DateTime.now();
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final String formattedDate = formatter.format(now);
    // Save the PDF
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/${invoiceResponse.invoice?.typeInvoice?.name??""}_${invoiceResponse.invoice?.code??""}_$formattedDate.pdf");
    await file.writeAsBytes(await pdf.save());

    AppLoaderDialog.dismiss(Get.context!);
    if(isMailSent != null && isMailSent){
      Utils.sendEmailWithAttachment(file);
    }else if(isDownload != null && isDownload){
      Utils.openFile(file);
    }else{
      await Printing.sharePdf(bytes: await pdf.save(), filename: '${invoiceResponse.invoice?.typeInvoice?.name??""}_${invoiceResponse.invoice?.code??""}_$formattedDate.pdf');
    }
  }
}
