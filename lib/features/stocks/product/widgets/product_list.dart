import 'package:flutter/material.dart';

import 'product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ProductItem()],
    );
  }
}
