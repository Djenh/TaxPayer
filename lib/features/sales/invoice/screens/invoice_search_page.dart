import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';

import '../widgets/invoice_item.dart';
import 'invoice_detail_page.dart';

class InvoiceSearchPage extends StatelessWidget {
  InvoiceSearchPage({super.key});

  List result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KContainer(child: KInput(name: "Invoice Tlo")),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: result.isEmpty
                  ? Container(
                      color: Colors.blue,
                      height: 200,
                      child: KnotFound(
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text("Add item"),
                        ),
                      ),
                    )
                  : ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: result
                          .map((e) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const InvoiceDetailPage(),
                                    ));
                              },
                              child: const InvoiceItem()))
                          .toList()),
            )
          ],
        ));
  }
}
