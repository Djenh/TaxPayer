import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/features/sales/invoice/widgets/modals/full_menu.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/utils.dart';


class InvoiceItem extends StatelessWidget {
  final InvoiceResponse? invoiceResponse;
  const InvoiceItem({super.key, this.onTap, this.invoiceResponse});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildInvoiceDetails(context)),
              const SizedBox(width: 12),
              _buildInvoiceStatus(context),
            ],
          ),
          Positioned(
            right: 5,
            child: GestureDetector(
                onTap: (){
                  showMoreMenu(context);
                },
                child: const Icon(Icons.more_vert_outlined))
          )
        ],
      ),
    );
  }


  Widget _buildInvoiceDetails(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: KStyles.primaryColor.withOpacity(0.1),
            child: const Icon(Iconsax.bill, color: KStyles.primaryColor),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildText(context, invoiceResponse?.invoice?.client?.name??"", 14, Colors.black, FontWeight.w600),
                const SizedBox(height: 4),
                _buildText(context, "Facture ${invoiceResponse?.invoice?.code??""}", 12, Colors.black, FontWeight.w300),
                const SizedBox(height: 4),
                _buildText(context, "${invoiceResponse!.invoice!.items!.length} ${invoiceResponse!.invoice!.items!.length <= 1 ? "article" : "articles"}", 10, Colors.grey, FontWeight.w400),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildInvoiceStatus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildText(context, Utils.getFormattedAmount(invoiceResponse!.total?.ttc??0), 14, Colors.black, FontWeight.w500)
        /*const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 1, color: Colors.green),
          ),
          child: _buildText(
            context, "Payée", 12, Colors.green, FontWeight.w600,
            textAlign: TextAlign.center,
          ),
        ),*/
      ],
    );
  }

  Widget _buildText(BuildContext context, String text, double fontSize, Color color, FontWeight fontWeight, {TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
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
      builder: (context) => FullMenu(invoiceResponse: invoiceResponse,
          isSaleInvoice: false),
    );
  }
}

