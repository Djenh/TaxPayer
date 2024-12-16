import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';

import '../../screens/invoice_recuring_page.dart';
import '../../screens/invoice_view_print_page.dart';
import 'delete_menu.dart';

class DefaultMenu extends StatelessWidget {
  const DefaultMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(context: context, tiles: [
        const KMenuItem(
          icon: Icons.remove_red_eye_outlined,
          title: "View Invoice",
          next: InvoicePrintViewPage(),
        ),
        const KMenuItem(
          icon: Icons.refresh,
          title: "Recuring",
          next: InvoiceRecurringPage(),
        ),
        const KMenuItem(
          icon: Icons.folder_shared_outlined,
          title: "Export",
          pop: true,
          routed: false,

        ),
        const DeleteMenu(),
        Container()
      ]).toList(),
    );
  }
}
