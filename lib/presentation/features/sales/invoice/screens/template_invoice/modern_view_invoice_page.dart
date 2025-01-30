import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/utils/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../res/style/e_style.dart';

class ModernViewInvoicePage extends StatefulWidget {
  final InvoiceResponse? invoiceResponse;
  const ModernViewInvoicePage({super.key, required this.isSaleInvoice,this.invoiceResponse});

  final bool isSaleInvoice;

  @override
  State<ModernViewInvoicePage> createState() => _ModernViewInvoicePageState();
}

class _ModernViewInvoicePageState extends State<ModernViewInvoicePage> {
  Widget _buildCompanyInfoCard(bool isCustomer, String rcm, String nameUser,
      String email, String phone, String adr, String ifu) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: KStyles.fieldGrey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !isCustomer
              ? Container(
                  padding: const EdgeInsets.all(6),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4)),
                )
              : const Icon(Iconsax.user_tag, color: Colors.black),
          const SizedBox(height: 8),
          buildText(context, rcm, 8, Colors.black, fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, nameUser, 10, Colors.black,
              fontWeight: FontWeight.w700),
          const SizedBox(height: 4),
          buildText(context, email, 8, Colors.black,
              fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, phone, 8, Colors.black,
              fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, adr, 8, Colors.black, fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
          buildText(context, ifu, 8, Colors.black,
              fontWeight: FontWeight.w300),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildReferenceCreditInvoice(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, title, 12, Colors.black,
            fontWeight: FontWeight.w400),
        buildText(context, value, 12, Colors.black, fontWeight: FontWeight.w400)
      ],
    );
  }

  Widget _buildTitleInvoice(String title, String numberInvoice) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildText(context, title, 24, Colors.black,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 4),
        buildText(context, numberInvoice, 14, Colors.black,
            fontWeight: FontWeight.w400)
      ],
    );
  }

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
              context, itemsEntities.item!.product!.productType??"".toUpperCase(), 10, KStyles.primaryColor,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 3),
        buildText(context, "${itemsEntities.item!.quantity??1} QTE x ${itemsEntities.item!.product?.price?.amount?.toString()??""}", 12, Colors.black,
            fontWeight: FontWeight.w500),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildText(context, "${itemsEntities.item!.product?.name??""}  [${itemsEntities.item!.product?.price?.taxGroup?.code??""}]", 12, Colors.black,
                fontWeight: FontWeight.w500),
            buildText(context, "*${Utils.getFormattedAmount(itemsEntities.total?.ttc!.toInt() as num)}", 12, Colors.black,
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
  Widget _buildRecapArticle(
      String title1, String value1, String title2, String value2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildText(context, title1, 14, Colors.black,
                fontWeight: FontWeight.w500),
            buildText(context, value1, 14, Colors.black,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildText(context, title2, 12, Colors.black,
                fontWeight: FontWeight.w500),
            buildText(context, value2, 13, Colors.black,
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

  Widget _buildRowDataSign(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, title, 8, Colors.black, fontWeight: FontWeight.w300),
        buildText(context, value, 8, Colors.black, fontWeight: FontWeight.w400),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildCompanyInfoCard(
                  false,
                  widget.invoiceResponse?.invoice?.pos?.company?.tin??"",
                  widget.invoiceResponse?.invoice?.pos?.company?.name??"",
                  widget.invoiceResponse?.invoice?.pos?.contact?.email??"",
                  widget.invoiceResponse?.invoice?.pos?.contact?.phoneNumber??"",
                  widget.invoiceResponse?.invoice?.pos?.company?.address?.description??"",
                  widget.invoiceResponse?.invoice?.pos?.company?.tradeNo??""),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildCompanyInfoCard(
                  true,
                  widget.invoiceResponse?.invoice?.client?.tin??"",
                  widget.invoiceResponse?.invoice?.client?.name??"",
                  widget.invoiceResponse?.invoice?.client?.contact?.email??"",
                  widget.invoiceResponse?.invoice?.client?.contact?.phoneNumber??"",
                  widget.invoiceResponse?.invoice?.client?.invoicingAddress?.description??"",
                  ""),
            ),
          ],
        ),
        if (!widget.isSaleInvoice) ...[
          const SizedBox(height: 10),
          _buildReferenceCreditInvoice(
              "Référence de facture originale", "#8003794792943927"),
        ],
        const SizedBox(height: 20),
        Center(
            child: _buildTitleInvoice(//(widget.isSaleInvoice ? "FACTURE DE VENTE" : "FACTURE D’AVOIR")
                widget.invoiceResponse?.invoice?.typeInvoice?.name??"",
                "N° ${widget.invoiceResponse?.invoice?.code??""}")),
        const SizedBox(height: 20),
        ListView.builder(
            itemCount: widget.invoiceResponse!.invoice!.items!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              final article = widget.invoiceResponse!.invoice!.items![i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildItemArticle(article),
              );
              /*
              if (i < 2) {
                // Articles
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildItemArticle(),
                );
              } else if (i == 2) {
                // Section TOTAL
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildRecapArticle(
                      "TOTAL", "*16.000", "REGIME TPS  [E]", "*16.000"),
                );
              } else if (i == 3) {
                // Section ESPECES
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildRecapArticle(
                      "ESPECES :", "*16.000", "NBR d’articles :", "2"),
                );
              } else {
                return const SizedBox.shrink();
              }
               */
            }),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildRecapArticle(
              "TOTAL", "*${Utils.getFormattedAmount(widget.invoiceResponse!.total?.ttc??0)}", "", ""),
        ),
        buildText(
            context, "Répartition des taxes".toUpperCase(), 10, KStyles.primaryColor,
            fontWeight: FontWeight.w400),
        ...?widget.invoiceResponse?.taxBreakDown?.map((e) => Padding(
          padding:  const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildRecapArticle(
              e.taxGroup?.name??"", "*${e.total}", "${e.taxGroup?.code} (${e.taxGroup?.rate}%)", ""),
        )).toList(),
        const SizedBox(height: 40),
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
                  data:  '${widget.invoiceResponse?.signatureData?.qrCode?.toString()}',
                  version: QrVersions.auto,
                  size: 100.0,
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
                  _buildRowDataSign("Date, Heure", widget.invoiceResponse?.signatureData?.certifiedDate?.toString()??"")
                ],
              ))
            ],
          ),
        ),
        const SizedBox(height: 20),
        buildText(
            context,
            "Arrêté la présente facture à la somme"
            " de ${widget.invoiceResponse?.totalInletters.toString()}",
            8,
            Colors.black,
            fontWeight: FontWeight.w600,
            maxLine: 2),
        const SizedBox(height: 20),
      ],
    );
  }
}
