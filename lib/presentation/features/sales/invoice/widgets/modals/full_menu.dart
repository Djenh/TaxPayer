import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/invoice_recuring_page.dart';




 /*class FullMenu extends StatelessWidget {
  const FullMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.transparent,
            child: Wrap(
              children: ListTile.divideTiles(context: context, tiles: [
                const KMenuItem(
                  icon: Icons.edit,
                  title: "Edit",
                  routed: false,
                ),
                const KMenuItem(
                  icon: Icons.remove_red_eye_outlined,
                  title: "View ",
                  next: InvoicePrintViewPage(),
                ),
                const KMenuItem(
                  icon: Icons.refresh,
                  title: "Recurring",
                  next: InvoiceRecurringPage(),
                ),
              ]).toList(),
            )),
        Container(
          color: Colors.white,
          height: 5,
        ),
        Wrap(
          children: ListTile.divideTiles(context: context, tiles: [
            const KMenuItem(
              icon: Icons.dashboard_outlined,
              title: "Change Template",
              next: InvoiceTemplateChoicePage(),
            ),
            const KMenuItem(
              icon: Icons.copy,
              title: "Duplicate Invoice ",
              pop: false,
              routed: false,
            ),
            KMenuItem(
              icon: Icons.check_circle_outline,
              title: "Mark as paid",
              routed: false,
              onTap: () {},
            ),
          ]).toList(),
        ),
        Container(
          color: Colors.white,
          height: 5,
        ),
        const ExportMenu(totalInfo: false),
       Container(
         color: Colors.white,
         height: 5,
       ),
        const DeleteMenu(),
      ],
    );
  }
}*/

class FullMenu extends StatelessWidget {
  const FullMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> actions = [
      {"icon": Iconsax.edit, "label": "Modifier", "action": () => _navigateToEdit(context)},
      {"icon": Iconsax.eye, "label": "Visualiser", "action": () => _navigateToView(context)},
      {"icon": Iconsax.refresh, "label": "Recurring", "action": () => _navigateToRecurring(context)},
      {"icon": Iconsax.edit, "label": "Change Template", "action": () => _navigateToTemplate(context)},
      {"icon": Iconsax.copy, "label": "Dupliquer la facture", "action": () => _navigateToDuplicate(context)},
      {"icon": Iconsax.tick_circle, "label": "Marquer comme payer", "action": () => _markAsPaid(context)},
      {"icon": Iconsax.export, "label": "Exporter PDF", "action": () => _exportPdf(context)},
      {"icon": Iconsax.sms, "label": "Envoyer par Email", "action": () => _sendEmail(context)},
      {"icon": Iconsax.save_2, "label": "Savegarder", "action": () => _save(context)},
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

  void _exportPdf(BuildContext context) {
    debugPrint("Exporter en PDF !");
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
