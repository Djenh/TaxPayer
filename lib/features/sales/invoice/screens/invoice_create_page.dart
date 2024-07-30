import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kTextgray.dart';
import 'package:invoice_app/commons/widgets/koutlinedbutton.dart';
import 'package:invoice_app/features/clients/screens/client_search_page.dart';

import '../../../../commons/widgets/kTextwhite.dart';
import '../../../../commons/widgets/kcontainer.dart';
import '../../../../commons/widgets/kelevatedbutton.dart';
import '../widgets/modals/default_menu.dart';
import 'invoice_item_page.dart';


class InvoiceCreatePage extends StatelessWidget {
  InvoiceCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Facture"),
            Row(
              children: [
                KtextGray("12344"),
                SizedBox(
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: ListView(
        children: [
          KContainer(
            title: "Invoice",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: KtextGray(
                              "Type Invoice",
                            ),
                            subtitle: Text(
                              "Facture de vente - FV",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                            trailing: Icon(Icons.arrow_drop_down),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0 * 4,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: KtextGray(
                              "Security Tax",
                            ),
                            subtitle: Text(
                              "AIB 1%",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                            trailing: Icon(Icons.arrow_drop_down),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Divider()
                        ],
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
              title: KtextGray(
                "Invoice To",
              ),
              subtitle: Text(
                "Select  a client",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_drop_down),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Invoice Items",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    title: Text("Lait djado"),
                    subtitle: KtextGray("Qte: Z"),
                    trailing: Text("2000 XOD"),
                    contentPadding: EdgeInsets.zero,
                  ),
                  ListTile(
                    title: Text("Lait djado"),
                    subtitle: KtextGray("Qte: Z"),
                    trailing: Text("2000 XOD"),
                    contentPadding: EdgeInsets.zero,
                  ),
                ]).toList(),
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
                  child: Text("Add Item"),
                )
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: KElevatedButton(
                    onPressed: () {},
                    child: KTextWhite(
                      "Create Invoice",
                    ))),
            SizedBox(width: 10),
            KOutlinedButton(
              child: Icon(Icons.more_horiz),
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
            child: DefaultMenu()
            ,
          ),
        );
      },
    );
  }
}
