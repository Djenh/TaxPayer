import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/manual_check_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../../../_widgets/build_text.dart';

class ErrorScanDialog extends StatelessWidget {
  const ErrorScanDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: KStyles.warningInvoice,
      title: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Iconsax.danger, color: KStyles.dangerColor),
          const SizedBox(height: 8),
          buildText(context, "Erreur de lecture", 16,
              KStyles.dangerColor, fontWeight: FontWeight.w700)
        ],
      ),
      content: buildText(context, "Une erreur s’est survenues lors du scan du qr code, veuillez procéder à la vérification manuelle.", 12,
          KStyles.dangerColor, fontWeight: FontWeight.w400, maxLine: 3, textAlign: TextAlign.center),
      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: KStyles.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.pop(context);
              Get.to(() => const ManualCheckPage());
            },
            child: buildText(context, "Vérifier manuellement", 14, Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
