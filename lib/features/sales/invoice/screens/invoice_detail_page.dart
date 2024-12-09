import 'package:flutter/material.dart';
import 'package:invoice_app/features/sales/invoice/widgets/modals/full_menu.dart';


import '../../../../commons/ui/kTextgray.dart';
import '../../../../commons/ui/kcontainer.dart';


class InvoiceDetailPage extends StatelessWidget {
  const InvoiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jean Louis"),
        actions: [
          IconButton(
              onPressed: () {
                showMoreMenu(context);
              },
              icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: ListView(
        children: [
          KContainer(
            title: "Client",
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KtextGray(
                          "Invoice No",
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("#12345784"),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KtextGray(
                          "Date",
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("10/34/23"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KtextGray(
                      "Invoice To",
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("Georges Cress HOUNNOUKON"),
                  ],
                ),
              ],
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
              children: ListTile.divideTiles(context: context, tiles: [
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
              ]).toList(),
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
    );
  }

  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height*0.60,
          child:  FullMenu(),
        ));
      },
    );
  }
}
