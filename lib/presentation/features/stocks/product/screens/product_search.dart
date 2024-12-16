import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';

import '../widgets/product_item.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const KContainer(
              child: KInput(
                name: "Product name",
                keyboardType: TextInputType.text,
                showclearButton: true,
              )),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView(
            shrinkWrap: true,
                children: ListTile.divideTiles(
                    context: context, tiles: [
                  InkWell(
                     onTap: () {
                       Navigator.pop(context, "PRO");
                     },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const ProductItem())),
            
            
                // ... other ProductItem widgets
                ]).toList(),
                ),
          ),


        ],
      ),
    );
  }
}
