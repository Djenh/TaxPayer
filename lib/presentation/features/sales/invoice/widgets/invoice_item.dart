import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class InvoiceItem extends StatelessWidget {
  const InvoiceItem({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: _buildInvoiceDetails(context)),
            _buildInvoiceStatus(context),
          ],
        ),
      ),
    );
  }


  Widget _buildInvoiceDetails(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: KStyles.primaryColor.withOpacity(0.1),
          child: const Icon(Iconsax.bill, color: KStyles.primaryColor),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildText(context, "Jorge Maso", 14, Colors.black, FontWeight.w600),
            const SizedBox(height: 4),
            _buildText(context, "Facture #80903Biy", 12, Colors.black, FontWeight.w300),
            const SizedBox(height: 4),
            _buildText(context, "4 articles", 10, Colors.grey, FontWeight.w400),
          ],
        ),
      ],
    );
  }


  Widget _buildInvoiceStatus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildText(context, "400000 XOF", 14, Colors.black, FontWeight.w500),
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
}

