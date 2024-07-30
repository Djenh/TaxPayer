import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kinput.dart';
import 'package:invoice_app/commons/widgets/knotfound.dart';
import 'package:invoice_app/features/clients/widgets/client_item.dart';


import '../../../commons/widgets/kcontainer.dart';
import '../../sales/invoice/screens/invoice_detail_page.dart';
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
            SizedBox(
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
                                  builder: (context) => ClientCreatePage(),
                                ));
                          },
                          child: Text("Add item"),
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
                                  builder: (context) => InvoiceDetailPage(),
                                ));
                          },
                          child: ClientItem())).toList()

                    ),
            )
          ],
        ));
  }
}
