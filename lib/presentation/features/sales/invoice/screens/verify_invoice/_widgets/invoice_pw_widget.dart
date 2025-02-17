import 'package:flutter/material.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


// Conversion function (as defined above)
PdfColor convertFlutterColorToPdfColor(Color color) {
  return PdfColor(
    color.red / 255,
    color.green / 255,
    color.blue / 255,
  );
}
pw.Widget buildQrCode(String qrCodeData) {
  return pw.BarcodeWidget(
    barcode: pw.Barcode.qrCode(),
    data: qrCodeData,
    width: 100,
    height: 100,
  );
}
final pageWidth = PdfPageFormat.a4.width; // Largeur de la page A4 par défaut


// Calculer la moitié de la largeur de la page
final halfPageWidth = pageWidth / 2;
pw.Widget buildPwCompanyInfoCard(bool isCustomer, String rcm, String nameUser,
    String email, String phone, String adr, String ifu,final pwImage) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(8),
    width: halfPageWidth,
    decoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(6),
        border: pw.Border.all(color: convertFlutterColorToPdfColor(KStyles.fieldGrey))),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        !isCustomer
            ?  pw.Container(
          padding: const  pw.EdgeInsets.all(6),
          width: 20,
          height: 20,
          decoration:  pw.BoxDecoration(
              color: convertFlutterColorToPdfColor(Colors.grey),
              borderRadius: pw.BorderRadius.circular(4)),
        )
            : pw.Image(pwImage,width: 20,
            height: 20),//Iconsax.user_tag
        pw.SizedBox(height: 8),
        buildPwText(rcm, 8, PdfColors.black),
        pw.SizedBox(height: 4),
        buildPwText(nameUser, 10, PdfColors.black),
        pw.SizedBox(height: 4),
        buildPwText(email, 8, PdfColors.black),
        pw.SizedBox(height: 4),
        buildPwText(phone, 8, PdfColors.black),
        pw.SizedBox(height: 4),
        buildPwText(adr, 8, PdfColors.black),
        pw.SizedBox(height: 4),
        buildPwText(ifu, 8, PdfColors.black),
        pw.SizedBox(height: 4),
      ],
    ),
  );
}
pw.Widget buildPwText(String text, double fontSize,
    PdfColor color, {pw.FontWeight? fontWeight, pw.TextAlign? textAlign, int? maxLine}) {
  return pw.Text(
    text,
    maxLines: maxLine,
    style: pw.TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight ?? pw.FontWeight.normal,
    )
  );
}


pw.Widget buildReferenceCreditInvoice(String title, String value) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      buildPwText(title, 12, PdfColors.black),
      buildPwText(value, 12, PdfColors.black)
    ],
  );
}

pw.Widget buildTitleInvoice(String title, String numberInvoice) {
  return pw.Column(
    mainAxisAlignment: pw.MainAxisAlignment.center,
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      buildPwText(title, 24, PdfColors.black),
      pw.SizedBox(height: 4),
      buildPwText(numberInvoice, 14, PdfColors.black)
    ],
  );
}

pw.Widget buildItemArticle(ItemsEntities itemsEntities,bool isSifecModel) {
  return pw.Column(
    mainAxisAlignment: pw.MainAxisAlignment.start,
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        decoration: pw.BoxDecoration(
          color: convertFlutterColorToPdfColor(KStyles.invoiceBgColor),
          borderRadius: pw.BorderRadius.circular(4),
        ),
        padding: const pw.EdgeInsets.all(4),
        child: buildPwText(isSifecModel? itemsEntities.item?.typeProduct?.name??"".toUpperCase() : itemsEntities.item?.product?.productType??"".toUpperCase(), 10, convertFlutterColorToPdfColor(KStyles.primaryColor)),
      ),
      pw.SizedBox(height: 3),
      buildPwText("${itemsEntities.item?.quantity??1} QTE x ${itemsEntities.item?.price.toString()??""}", 12,PdfColors.black),
      pw.SizedBox(height: 3),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          buildPwText("${isSifecModel? itemsEntities.item?.name??"" :itemsEntities.item?.product?.name??""}  [${isSifecModel? itemsEntities.item?.taxGroup?.code??"" :itemsEntities.item?.product?.price?.taxGroup?.code??""}]", 12,PdfColors.black),
          buildPwText("*${Utils.getFormattedAmount(itemsEntities.total?.ttc!.toInt() as num)}", 12,PdfColors.black),
        ],
      ),
      pw.SizedBox(height: 3),
      DottedDashedLine(),
    ],
  );
}

pw.Widget DottedDashedLine() {
  return pw.Text(generateDottedLine(pageWidth),
    style: const pw.TextStyle(
      fontSize: 12,
      color: PdfColors.grey,
    ),
  );
}
String generateDottedLine(double pageWidth) {
  const dashWidth = 5; // Largeur approximative d'un tiret à fontSize 12
  final availableWidth = pageWidth; // Marge de 20px de chaque côté
  final numDashes = (availableWidth / dashWidth).floor(); // Nombre de tirets nécessaires
  return List.generate(numDashes, (_) => "-").join(); // Générer une ligne
}
/*
  Widget _buildItemArticle(ItemsEntities itemsEntities) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: KStyles.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(4),
          child: buildText(
              context, itemsEntities.item!.product!.code!, 10, KStyles.primaryColor,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 3),
        buildText(context, "${itemsEntities.item!.quantity??1} QTE x ${itemsEntities.item!.product?.price?.amount?.toString()??""} = ${itemsEntities.item!.product?.price?.subTotal?.ttc?.toString()??""}", 12, Colors.black,
            fontWeight: FontWeight.w500),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildText(context, "EAUX MINERALES  [E]", 12, Colors.black,
                fontWeight: FontWeight.w500),
            buildText(context, "*1.000", 12, Colors.black,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(height: 3),
        const DottedDashedLine(
            height: 0,
            width: double.infinity,
            axis: Axis.horizontal,
            strokeWidth: 0.5),
      ],
    );
  }
   */
pw.Widget buildRecapArticle(String title1, String value1, String title2, String value2) {
  return pw.Column(
    children: [
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          buildPwText(title1, 14,PdfColors.black),
          buildPwText(value1, 14,PdfColors.black),
        ],
      ),
      pw.SizedBox(height: 4),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          buildPwText(title2, 12,PdfColors.black),
          buildPwText(value2, 13,PdfColors.black),
        ],
      ),
      pw.SizedBox(height: 3),
      DottedDashedLine(),
    ],
  );
}

pw.Widget buildRowDataSign(String title, String value) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      buildPwText(title, 8,PdfColors.black),
      buildPwText(value, 8,PdfColors.black),
    ],
  );
}

pw.Widget buildInvoiceItems(List<dynamic>? items,bool isSifecModel) {
  if (items == null || items.isEmpty) {
    return pw.Text("Aucun article trouvé.");
  }

  return pw.Column(
    children: items.asMap().entries.map((entry) {
      final int i = entry.key;
      final dynamic article = entry.value;
      return pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 12.0), // Utilisez pw.EdgeInsets
        child: buildItemArticle(article,isSifecModel), // IMPORTANT : pas de BuildContext Flutter
      );
    }).toList(),
  );
}