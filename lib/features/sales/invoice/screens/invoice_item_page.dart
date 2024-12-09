import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import '../../../stocks/product/screens/product_create_page.dart';
import '../../../stocks/product/taxgroup/tax_group.dart';

class InvoiceItemPage extends StatelessWidget {
  const InvoiceItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Item Detail",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const KtextGray(
                    "Produuct",
                  ),
                  subtitle: const Text("Select a product",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_drop_down),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductCreatePage(),
                          fullscreenDialog: true
                        ));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(),
                const SizedBox(
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
                    const SizedBox(
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
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Taxe Description",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text("Tax Group"),
                  trailing: const Icon(Icons.arrow_drop_down),
                  subtitle: const KtextGray("A-ex (0%) -EXONERATE"),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaxgroupPage(),
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
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Subtotal",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        const Text("Qte: Z"),
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
                const KtextGray("Total Amount"),
                Text(
                  "2000",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              width: 10 * 3,
            ),
            Expanded(
              child: KElevatedButton(
                  child: const Text(
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
