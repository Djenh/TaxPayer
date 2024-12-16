import 'package:flutter/material.dart';

import 'client_item.dart';


class ClientList extends StatelessWidget {
  final List? items;

  const ClientList({super.key, this.items});

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
                      child: const ClientItem(),
                      onTap: () {},
                    ))
                .toList()
            : []);
  }
}
