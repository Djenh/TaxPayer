import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';




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
      {"icon": Iconsax.edit, "label": "Modifier"},
      {"icon": Iconsax.eye, "label": "Visualiser"},
      {"icon": Iconsax.refresh, "label": "Recurring"},
      {"icon": Iconsax.edit, "label": "Change Template"},
      {"icon": Iconsax.copy, "label": "Dupliquer la facture"},
      {"icon": Iconsax.tick_circle, "label": "Marquer comme payer"},
      {"icon": Iconsax.export, "label": "Exporter PDF"},
      {"icon": Iconsax.sms, "label": "Envoyer par Email"},
      {"icon": Iconsax.save_2, "label": "Savegarder"},
      {"icon": Iconsax.trash, "label": "Supprimer"},
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
                },
              ),
              const Divider(height: 1),
            ],
          );
        }).toList(),
      ),
    );
  }
}
