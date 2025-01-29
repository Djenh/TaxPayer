import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../../../../res/style/e_style.dart';
import '../widgets/invoice_item.dart';
import 'invoice_detail_page.dart';

/*class InvoiceSearchPage extends StatelessWidget {
  InvoiceSearchPage({super.key});


  List result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KContainer(child: KInput(name: "Invoice Tlo")),
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
}*/


class InvoiceSearchPage extends StatefulWidget {
  const InvoiceSearchPage({super.key});

  @override
  State<InvoiceSearchPage> createState() => _InvoiceSearchPageState();
}

class _InvoiceSearchPageState extends State<InvoiceSearchPage> {

  TextEditingController? searchController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController?.dispose();
  }


  Widget _buildInvoiceList(){
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int inv){
          return InvoiceItem(
            onTap: () => Get.to(() => const InvoiceDetailPage(invoiceResponse: null)),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Rechercher facture"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Rechercher",
                //prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Iconsax.search_normal),
                  onPressed: () {
                    // TODO: Implémenter la recherche
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: KStyles.primaryColor,
                      width: 0.5),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _buildInvoiceList(),
          )
        ],
      ),
    );
  }


}
