import 'package:flutter/material.dart';

import '../../../../../domain/entities/product/product_response.dart';
import 'product_item.dart';

class ProductList extends StatelessWidget {
  final ProductResponse ctg;
  const ProductList({super.key,required this.ctg});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ProductItem(ctg: ctg)],
    );
  }
}
