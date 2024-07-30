import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/widgets/KMenuItem.dart';
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
                KMenuItem(
                  icon: Icons.edit,
                  title: "Edit",
                  routed: false,
                ),
                KMenuItem(
                  icon: Icons.remove_red_eye_outlined,
                  title: "View ",
                  next: InvoicePrintViewPage(),
                ),
                KMenuItem(
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
        Container(
            child: Wrap(
              children: ListTile.divideTiles(context: context, tiles: [
                KMenuItem(
                  icon: Icons.dashboard_outlined,
                  title: "Change Template",
                  next: InvoiceTemplateChoicePage(),
                ),
                KMenuItem(
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
            )),
        Container(
          color: Colors.white,
          height: 5,
        ),
        Container(child: ExportMenu(totalInfo: false)),
       Container(
         color: Colors.white,
         height: 5,
       ),
        Container(
          child: DeleteMenu(),
        ),
      ],
    );
  }
}
