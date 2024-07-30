import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kTextgray.dart';
import 'package:invoice_app/commons/widgets/kelevatedbutton.dart';
import 'package:invoice_app/commons/widgets/kinput.dart';

import '../../../../commons/widgets/kcontainer.dart';
import '../../../stocks/product/screens/product_create_page.dart';
import '../../../stocks/product/taxgroup/tax_group.dart';

class InvoiceItemPage extends StatelessWidget {
  InvoiceItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Item Detail",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: KtextGray(
                    "Produuct",
                  ),
                  subtitle: Text("Select a product",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_drop_down),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductCreatePage(),
                          fullscreenDialog: true
                        ));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: KInput(
                        name: "Quantity",
                        keyboardType: TextInputType.number,
                        initialValue: '0',
                      ),
                    ),
                    SizedBox(
                      width: 10 * 2.5,
                    ),
                    Expanded(
                      child: KInput(
                        name: "Price",
                        initialValue: '0',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Taxe Description",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Tax Group"),
                  trailing: Icon(Icons.arrow_drop_down),
                  subtitle: KtextGray("A-ex (0%) -EXONERATE"),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaxgroupPage(),
                            fullscreenDialog: true
                        ));
                  },
                ),
                KInput(
                  name: "Additional Tax",
                  keyboardType: TextInputType.number,
                  initialValue: '0',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Subtotal",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grand total",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KtextGray("Total Amount"),
                Text(
                  "2000",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              width: 10 * 3,
            ),
            Expanded(
              child: KElevatedButton(
                  child: Text(
                    "Add item",
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
