import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/k_list_tile.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/features/clients/screens/client_search_page.dart';
import 'package:invoice_app/features/sales/invoice/security_tax/security_tax_page.dart';
import 'package:invoice_app/features/sales/invoice/type_invoice/type_invoice_page.dart';

import '../widgets/modals/default_menu.dart';
import 'invoice_item_page.dart';

class InvoiceCreatePage extends StatelessWidget {
  const InvoiceCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Facture"),
            Row(
              children: [
                const Text("12344"),
                const SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.copy,
                  size: 15,
                  color: Theme.of(context).primaryColor,
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Iconsax.document_download))
        ],
      ),
      body: ListView(
        children: [
          KContainer(
            title: "Invoice",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: KListTile(
                        title: "Type de facture",
                        subtitle: "Facture de vente",
                        onTap: () => Get.to(() => TypeInvoicePage(),
                            fullscreenDialog: true),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0 * 4,
                    ),
                    Expanded(
                      child: KListTile(
                        title: "Secutrity tax",
                        subtitle: "20%",
                        onTap: () => Get.to(() => SecurityTaxPage(),
                            fullscreenDialog: true),
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
            title: "Client",
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClientSearchPage(),
                      fullscreenDialog: true),
                );
              },
              title: const KtextGray(
                "Invoice To",
              ),
              subtitle: const Text(
                "Select  a client",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_drop_down),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Invoice Items",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  const ListTile(
                    title: Text("Lait djado"),
                    subtitle: KtextGray("Qte: Z"),
                    trailing: Text("2000 XOD"),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const ListTile(
                    title: Text("Lait djado"),
                    subtitle: KtextGray("Qte: Z"),
                    trailing: Text("2000 XOD"),
                    contentPadding: EdgeInsets.zero,
                  ),
                ]),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InvoiceItemPage(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Text("Add Item"),
                )
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: KElevatedButton(
                    onPressed: () {},
                    child: const KTextWhite(
                      "Create Invoice",
                    ))),
            const SizedBox(width: 10),
            KOutlinedButton(
              child: const Icon(Icons.more_horiz),
              onPressed: () {
                showMoreMenu(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: const DefaultMenu(),
          ),
        );
      },
    );
  }
}
