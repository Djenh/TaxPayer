import 'package:flutter/material.dart';

import '../widgets/invoice_list.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoices"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: InvoiceList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
