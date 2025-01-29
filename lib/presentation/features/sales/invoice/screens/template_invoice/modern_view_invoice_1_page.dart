import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../../domain/entities/invoice/invoice_response.dart';
import '../../../../../res/style/e_style.dart';

class ModernViewInvoice1Page extends StatefulWidget {
  final InvoiceResponse? invoiceResponse;
  const ModernViewInvoice1Page({super.key, required this.isSaleInvoice,this.invoiceResponse});

  final bool isSaleInvoice;

  @override
  State<ModernViewInvoice1Page> createState() => _ModernViewInvoice1PageState();
}

class _ModernViewInvoice1PageState extends State<ModernViewInvoice1Page> {
  final List<Map<String, dynamic>> articles = [
    {
      "index": 1,
      "description":
          "Koku mu teri (le coq à la sauce de graines de courge) [B]",
      "quantity": 2,
      "price": "15.000",
      "total": "30.000"
    },
    {
      "index": 2,
      "description": "Jus d’orange [B]",
      "quantity": 2,
      "price": "3.000",
      "total": "6.000"
    },
    {
      "index": 3,
      "description": "Eau 1,5L [B]",
      "quantity": 1,
      "price": "2.000",
      "total": "2.000"
    },
    {
      "index": 4,
      "description": "Poisson [B]",
      "quantity": 2,
      "price": "1.000",
      "total": "2.000"
    },
  ];

  Widget _buildHeaderInvoice(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildText(context, title, 16, Colors.black,
                fontWeight: FontWeight.w700),
            const SizedBox(width: 4),
            const SizedBox(
              height: 20,
              child: VerticalDivider(color: Colors.grey, thickness: 2),
            ),
            const SizedBox(width: 4),
            buildText(context, value, 6, Colors.black,
                fontWeight: FontWeight.w600),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(30)),
              child: buildText(context, "Validée", 10, Colors.white,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        const SizedBox(height: 6),
        buildText(context, "Byte Innov It", 12, Colors.black,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _buildInfoCompany(bool isCustomer, String rcm, String nameUser,
      String email, String phone, String adr, String ifu) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: !isCustomer
          ? Container(
              padding: const EdgeInsets.all(6),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(4)),
            )
          : const Icon(Iconsax.user_tag, color: Colors.black),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(context, rcm, 10, Colors.black,
              fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, nameUser, 14, Colors.black,
              fontWeight: FontWeight.w700),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(context, email, 12, Colors.black,
              fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, phone, 12, Colors.black,
              fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, adr, 12, Colors.black,
              fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, "IFU : $ifu", 12, Colors.black,
              fontWeight: FontWeight.w300),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text,
      {int flex = 1, TextAlign textAlign = TextAlign.start, bool? isTotal}) {
    return Expanded(
      flex: flex,
      child: buildText(context, text, 14, Colors.black,
          textAlign: textAlign,
          fontWeight: (isTotal == true) ? FontWeight.w700 : FontWeight.w400),
    );
  }

  Widget _buildHeaderColum() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderCell("#", flex: 1),
          _buildHeaderCell("Désignation", flex: 5),
          _buildHeaderCell("Qte", flex: 2, textAlign: TextAlign.center),
          _buildHeaderCell("Prix", flex: 2, textAlign: TextAlign.center),
          _buildHeaderCell("Total",
              flex: 2, textAlign: TextAlign.end, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildItemRow(
      dynamic index, String description, int quantity, String price, String total) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItemCell("$index", flex: 1),
          _buildItemCell(description, flex: 5),
          _buildItemCell("$quantity", flex: 2, textAlign: TextAlign.center),
          _buildItemCell(price, flex: 2, textAlign: TextAlign.center),
          _buildItemCell(total,
              flex: 2, textAlign: TextAlign.end, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildItemCell(String text,
      {int flex = 1, TextAlign textAlign = TextAlign.left, bool? isTotal}) {
    return Expanded(
      flex: flex,
      child: buildText(context, text, 12, Colors.black,
          textAlign: textAlign,
          maxLine: 3,
          fontWeight: (isTotal == true) ? FontWeight.w700 : FontWeight.w300),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildText(context, title, 12, Colors.black,
              fontWeight: FontWeight.w700),
          const SizedBox(width: 4),
          buildText(context, value, 12, Colors.black,
              fontWeight: FontWeight.w300)
        ],
      ),
    );
  }

  Widget _buildRowDataSign(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, title, 8, Colors.black, fontWeight: FontWeight.w300),
        buildText(context, value, 8, Colors.black, fontWeight: FontWeight.w700),
      ],
    );
  }

  Widget _buildReferenceCreditInvoice(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(context, title, 17, Colors.black,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 4),
        buildText(context, value, 12, Colors.black, fontWeight: FontWeight.w400)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderInvoice(//widget.isSaleInvoice ? "Facture de vente" : "Facture d'avoir"
            widget.invoiceResponse?.invoice?.typeInvoice?.name??"",
            "N° ${widget.invoiceResponse?.invoice?.code??""}"),
        const Divider(color: Colors.grey, thickness: 1),
        const SizedBox(height: 20),
        _buildInfoCompany(
            false,
            "3 2019 8901 8920 2020",
            "ABC COMPANY",
            "abcCompany@gmail.com",
            "+24166567893",
            "Libreville, Gabon",
            "3201300924413"),
        const SizedBox(height: 20),
        _buildInfoCompany(
            true,
            "3 2019 1234 5678 9010 2201",
            "Marx GODJO SA",
            "marxGodjoSa@gmail.com",
            "+24145231988",
            "Cotonou, Benin",
            "4201300924213"),
        if (!widget.isSaleInvoice) ...[
          const SizedBox(height: 20),
          _buildReferenceCreditInvoice("Réf Facture originale", "N°: 123345"),
        ],
        const SizedBox(height: 30),
        Column(
          children: [
            _buildHeaderColum(),
            const Divider(thickness: 1),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: widget.invoiceResponse!.invoice!.items!.length,
                itemBuilder: (BuildContext context, int index) {
                  final article = widget.invoiceResponse!.invoice!.items![index];
                  return Column(
                    children: [
                      _buildItemRow(
                        article.item!.product!.code!,
                        article.item!.product?.name??"",
                        article.item!.quantity??1,
                        article.item!.product?.price?.amount?.toString()??"",
                        article.item!.product?.price?.subTotal?.ttc?.toString()??"",
                      ),
                      const Divider(thickness: 1),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildSummaryRow("Total", "${widget.invoiceResponse?.total?.ttc?.toString()}"),
        _buildSummaryRow("Base Imposable", "${widget.invoiceResponse?.total?.baseTaxable?.toString()}"),
        _buildSummaryRow("Taxe", "${widget.invoiceResponse?.total?.tax?.toString()}"),
        const SizedBox(height: 20),
        Center(
          child: buildText(
              context,
              "Arrêté la présente facture à la somme"
              " de ${widget.invoiceResponse?.totalInletters.toString()}",
              8,
              Colors.black,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              maxLine: 2),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: KStyles.fieldGrey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: QrImageView(
                  data: '${widget.invoiceResponse?.signatureData?.qrCode?.toString()}',
                  version: QrVersions.auto,
                  size: 100.0,
                  foregroundColor: Colors.green,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildText(context, "Signature", 8, Colors.black,
                      fontWeight: FontWeight.w300),
                  const SizedBox(height: 4),
                  buildText(
                      context, "${widget.invoiceResponse?.signatureData?.signature?.toString()}", 8, Colors.black,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 4),
                  _buildRowDataSign("TIN-POS-TI", "1230909-0834"),
                  const SizedBox(height: 4),
                  _buildRowDataSign("Ref logiciel", "9LEHE"),
                  const SizedBox(height: 4),
                  _buildRowDataSign("Date, Heure", "${widget.invoiceResponse?.signatureData?.certifiedDate.toString()}")
                ],
              ))
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
