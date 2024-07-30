import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kcontainer.dart';
import 'package:invoice_app/commons/widgets/kinput.dart';

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
          KContainer(
              child: KInput(
                name: "Product name",
                keyboardType: TextInputType.text,
                showclearButton: true,
              )),
          SizedBox(
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
                          padding: EdgeInsets.all(10),
                          child: ProductItem())),
            
            
                // ... other ProductItem widgets
                ]).toList(),
                ),
          ),


        ],
      ),
    );
  }
}
