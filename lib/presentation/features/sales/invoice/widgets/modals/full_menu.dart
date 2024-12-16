import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';


import '../../screens/invoice_recuring_page.dart';
import '../../screens/invoice_template_choice_page.dart';
import '../../screens/invoice_view_print_page.dart';
import 'delete_menu.dart';
import 'export_menu.dart';

class FullMenu extends StatelessWidget {
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
}
