import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kTextgray.dart';
import 'package:invoice_app/commons/widgets/kelevatedbutton.dart';

import 'invoice_template_choice_page.dart';


class InvoicePrintViewPage extends StatelessWidget {
  const InvoicePrintViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(" Invoice #12345 "),
            KtextGray("Joyeix rons"),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.download))],
      ),
      body: ListView(
        children: [
          // Company info
          Container(
            padding: EdgeInsets.all(10 * 2),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Brand"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("omeganumeric.tech"),
                    Text("+229 62822317"),
                    Text("contact@omeganumeric.tech"),
                  ],
                )
              ],
            ),
          ),
          // Invoice and Client infos
          Container(
            padding: EdgeInsets.all(10 * 2),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invoice To"),
                      Text("Mr. John DOE"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Adresse"),
                          Text("Lula del Reivera de la founte"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Invoice No"),
                          Text("#330303"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Invoice Date"),
                        Text("29/10/2020"),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // Invoice items
          Container(
            padding: EdgeInsets.all(10 * 2),
            color: Colors.white,
            child: Column(
              children: [],
            ),
          ),
          // Invoice subtoal
          Container(),
          // Invoice Toal
          Container(),
          // Cetifiy Invoice
          Container(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: KElevatedButton(
          child: Text("Change theme"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => InvoiceTemplateChoicePage(),));
          },
        ),
      ),
    );
  }
}
