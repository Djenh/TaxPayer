import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/k_menu_item.dart';

class DeleteMenu extends StatelessWidget {
  const DeleteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return KMenuItem(
      icon: Icons.delete,
      color: Colors.red,
      title: "Delete",
      routed: false,
      pop: false,
      onTap: () {},
    );
  }
}
