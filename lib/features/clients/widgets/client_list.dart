import 'package:flutter/material.dart';
import 'package:invoice_app/features/clients/widgets/client_item.dart';

class ClientList extends StatelessWidget {
  final List? items;

  ClientList({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.blue,
      Colors.deepOrangeAccent,
      Colors.orange,
      Colors.purple,
      Colors.deepPurple,
      Colors.green,
      Colors.black,
      Colors.red,
    ];

    return ListView(
        children: items != null
            ? items!
                .map((e) => InkWell(
                      child: ClientItem(),
                      onTap: () {},
                    ))
                .toList()
            : []);
  }
}
