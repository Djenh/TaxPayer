import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/KMenuItem.dart';

import '../../screens/invoice_recuring_page.dart';
import '../../screens/invoice_view_print_page.dart';
import 'delete_menu.dart';

class DefaultMenu extends StatelessWidget {
  const DefaultMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          KMenuItem(
            icon: Icons.remove_red_eye_outlined,
            title: "View Invoice",
            next: InvoicePrintViewPage(),
          ),
          KMenuItem(
            icon: Icons.refresh,
            title: "Recuring",
            next: InvoiceRecurringPage(),
          ),
          KMenuItem(
            icon: Icons.folder_shared_outlined,
            title: "Export",
            pop: true,
            routed: false,

          ),
          DeleteMenu(),
          Container()
        ]).toList(),
      ),
    );
  }
}
