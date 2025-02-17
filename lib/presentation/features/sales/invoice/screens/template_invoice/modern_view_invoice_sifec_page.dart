import 'package:flutter/material.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/_widgets/invoice_widgets.dart';
import 'package:invoice_app/utils/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../res/style/e_style.dart';

class ModernSifecViewInvoicePage extends StatefulWidget {

  final InvoiceResponse? invoiceResponse;
  final bool isSaleInvoice;

  const ModernSifecViewInvoicePage({super.key, required this.isSaleInvoice,
    this.invoiceResponse});



  @override
  State<ModernSifecViewInvoicePage> createState() => _ModernSifecViewInvoicePageState();
}

class _ModernSifecViewInvoicePageState extends State<ModernSifecViewInvoicePage> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildCompanyInfoCard(context,
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
              child: buildCompanyInfoCard(context,
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
          buildReferenceCreditInvoice(context,
              "Référence de facture originale", widget.invoiceResponse?.invoice?.externalInvoiceNo??""),
        ],
        const SizedBox(height: 20),
        Center(
            child: buildTitleInvoice(//(widget.isSaleInvoice ? "FACTURE DE VENTE" : "FACTURE D’AVOIR")
                context,widget.invoiceResponse?.invoice?.typeInvoice?.name??"",
                "N° ${widget.invoiceResponse?.invoice?.externalInvoiceNo??""}")),
        const SizedBox(height: 20),
        ListView.builder(
            itemCount: widget.invoiceResponse?.invoice?.items?.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              final article = widget.invoiceResponse?.invoice?.items?[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: buildItemSifecArticle(context,article!),
              );
            }),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: buildRecapArticle(context,
              "TOTAL", "*${Utils.getFormattedAmount(widget.invoiceResponse?.total?.ttc??0)}", "", ""),
        ),
        buildText(
            context, "Répartition des taxes".toUpperCase(), 10, KStyles.primaryColor,
            fontWeight: FontWeight.w400),
        ...?widget.invoiceResponse?.taxBreakDown?.map((e) => Padding(
          padding:  const EdgeInsets.symmetric(vertical: 8.0),
          child: buildRecapArticle(context,
              e.taxGroup?.name??"", "*${e.total??0}", "${e.taxGroup?.code??""} (${e.taxGroup?.rate??0}%)", ""),
        )),
        const SizedBox(height: 20),
        buildText(
            context,
            "Arrêté la présente facture à la somme"
                " de ${widget.invoiceResponse?.totalInletters?.toString()??""}",
            8,
            Colors.black,
            fontWeight: FontWeight.w600,
            maxLine: 2),
        const SizedBox(height: 30),
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
                      buildRowDataSign(context,"TIN-POS-TI", "1230909-0834"),
                      const SizedBox(height: 4),
                      buildRowDataSign(context,"Ref logiciel", "9LEHE"),
                      const SizedBox(height: 4),
                      buildRowDataSign(context,"Date, Heure", widget.invoiceResponse?.signatureData?.certifiedDate?.toString()??"")
                    ],
                  ))
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
