import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/K_invoice_item.dart';
import 'package:invoice_app/commons/ui/k_list_tile.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/features/clients/screens/client_search_page.dart';
import 'package:invoice_app/features/sales/invoice/security_tax/security_tax_page.dart';
import 'package:invoice_app/features/sales/invoice/type_invoice/type_invoice_page.dart';
import 'package:invoice_app/features/sales/invoice/widgets/invoice_item.dart';

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
                  height: 5,
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
                      width: 5.0 * 4,
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
          KContainer(
            title: "Client",
            child: KListTile(
              title: "Facture adressée à",
              subtitle: "Client Divers",
              onTap: () =>
                  Get.to(() => ClientSearchPage(), fullscreenDialog: true),
            ),
          ),
          KContainer(
            title: "Contenu de la factture",
            action: TextButton(
              onPressed: ()=> Get.to( ()=>InvoiceItemPage(), fullscreenDialog: true ),
              child: Text("Ajouter"),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  KInvoiceItem(),
                  KInvoiceItem(),
                  KInvoiceItem(),

                ]),

              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          KContainer(
            title: "Répartiton des taxes",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text(
                          "100.000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
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
            const SizedBox(width: 5),
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
