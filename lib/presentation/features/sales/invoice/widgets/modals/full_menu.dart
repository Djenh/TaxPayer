import 'package:invoice_app/core/services/pdf_generate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/features/sales/invoice/credit_invoice/credit_invoice_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/invoice_recuring_page.dart';



class FullMenu extends StatelessWidget {
  final InvoiceResponse? invoiceResponse;
  final bool? isSaleInvoice;
  const FullMenu({super.key,this.invoiceResponse,this.isSaleInvoice});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> actions = [
      {"icon": Iconsax.document, "label": "Créer une facture d'avoir", "action": () => _navigateToInvoiceA(context)},
      {"icon": Icons.upload_outlined, "label": "Télécharger PDF", "action": () => GeneratePdfService.generateAndPrintPdf(invoiceResponse!,isSaleInvoice!,true,false,isDownload: true)},
      {"icon": Iconsax.eye, "label": "Voir les factures d'avoir associées", "action": () => _navigateToEdit(context)},
      //{"icon": Iconsax.eye, "label": "Visualiser", "action": () => _navigateToView(context)},
     // {"icon": Iconsax.refresh, "label": "Recurring", "action": () => _navigateToRecurring(context)},
     // {"icon": Iconsax.edit, "label": "Change Template", "action": () => _navigateToTemplate(context)},
      {"icon": Iconsax.copy, "label": "Dupliquer la facture", "action": () => _navigateToDuplicate(context)},
      //{"icon": Iconsax.tick_circle, "label": "Marquer comme payer", "action": () => _markAsPaid(context)},
      {"icon": Iconsax.export, "label": "Exporter PDF", "action": () => GeneratePdfService.generateAndPrintPdf(invoiceResponse!,isSaleInvoice!,true,false)},
      {"icon": Iconsax.sms, "label": "Envoyer par Email", "action": () => GeneratePdfService.generateAndPrintPdf(invoiceResponse!,isSaleInvoice!,true,false,isMailSent: true)},
      //{"icon": Iconsax.save_2, "label": "Savegarder", "action": () => _save(context)},
      {"icon": Iconsax.trash, "label": "Supprimer", "action": () => _delete(context)},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: actions.map((action) {
          return Column(
            children: [
              ListTile(
                leading: Icon(action["icon"], color: Colors.black),
                title: Text(
                  action["label"],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint("${action["label"]} cliqué !");
                  action["action"]();
                },
              ),
              const Divider(height: 1),
            ],
          );
        }).toList(),
      ),
    );
  }


  // Fonctions de navigation pour chaque action
  void _navigateToInvoiceA(BuildContext context) {
    Get.to(() => CreditInvoicePage(dataInvoice: invoiceResponse));
  }

  void _navigateToEdit(BuildContext context) {}

  void _navigateToView(BuildContext context) {}

  void _navigateToRecurring(BuildContext context) {
    Get.to(() => const InvoiceRecurringPage());
  }

  void _navigateToTemplate(BuildContext context) {}

  void _navigateToDuplicate(BuildContext context) {}

  void _markAsPaid(BuildContext context) {
    debugPrint("Marquer comme payé !");
  }

  void _sendEmail(BuildContext context) {
    debugPrint("Envoyer par Email !");
  }

  void _save(BuildContext context) {
    debugPrint("Sauvegarder !");
  }

  void _delete(BuildContext context) {
    debugPrint("Supprimer !");
  }

}
