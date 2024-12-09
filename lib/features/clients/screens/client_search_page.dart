import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';


import '../../sales/invoice/screens/invoice_detail_page.dart';
import '../widgets/client_item.dart';
import 'client_create_page.dart';

class ClientSearchPage extends StatelessWidget {
  ClientSearchPage({super.key});

  List result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KContainer(child: KInput(name: "Invoice To")),
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
                            print("object");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClientCreatePage(),
                                ));
                          },
                          child: const Text("Add item"),
                        ),
                      ),
                  )
                  : ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: result.map((e) =>   InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const InvoiceDetailPage(),
                                ));
                          },
                          child: const ClientItem())).toList()

                    ),
            )
          ],
        ));
  }
}
