import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../widgets/modals/full_menu.dart';



/*class InvoiceDetailPage extends StatelessWidget {
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
          const KContainer(
            title: "Client",
            child: Column(
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
          child:  const FullMenu(),
        ));
      },
    );
  }
}*/


class InvoiceDetailPage extends StatefulWidget {
  const InvoiceDetailPage({super.key});

  @override
  State<InvoiceDetailPage> createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends State<InvoiceDetailPage> {




  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: KStyles.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(context, "Compagnie Name", 14, Colors.black,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 4),
              buildText(context, "TIN : 5241 2541 4152", 12, Colors.black,
                  fontWeight: FontWeight.w300),
              const SizedBox(height: 4),
              buildText(context, "+229 59142644 | statup@gmail.com", 12, Colors.black,
                  fontWeight: FontWeight.w300),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rowItem({String? label, String? content}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, label ?? "", 14, Colors.black,
            fontWeight: FontWeight.w300),
        buildText(context, content ?? "", 14, Colors.black,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _buildInvoiceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rowItem(label: "N° facture : #25738", content: "Date : 12/07/2024"),
        const SizedBox(height: 10),
        _rowItem(label: "Invoice To :", content: "Mr. John DOE"),
        const SizedBox(height: 10),
        _rowItem(label: "Adresse :", content: "Akpakpa"),
        const SizedBox(height: 10),
        _rowItem(label: "N° téléphone :", content: "+229 56541240")
      ],
    );
  }

  Widget _buildInvoiceTable() {
    return Table(
      border: TableBorder.all(color: Colors.black, width: 1),
      children: const [
        TableRow(
          decoration: BoxDecoration(color: Colors.black),
          children: [
            _TableCell(label: "ITEM", isHeader: true),
            _TableCell(label: "PRIX", isHeader: true),
            _TableCell(label: "QUANTITE", isHeader: true),
            _TableCell(label: "TOTALE", isHeader: true),
          ],
        ),
        TableRow(
          children: [
            _TableCell(label: "Lait Jago"),
            _TableCell(label: "250 XOD"),
            _TableCell(label: "25 XOD"),
            _TableCell(label: "6250 XOD"),
          ],
        ),
        TableRow(
          children: [
            _TableCell(label: "Riz Gino"),
            _TableCell(label: "1000 XOD"),
            _TableCell(label: "8 XOD"),
            _TableCell(label: "8000 XOD"),
          ],
        ),
      ],
    );
  }

  Widget _buildInvoiceSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const _InvoiceSummaryRow(label: "Sous total :", value: "14250 XOD"),
        const _InvoiceSummaryRow(label: "Taxe appliquée (20%) :", value: "2850 XOD"),
        const Divider(thickness: 1),
        Container(
          decoration: const BoxDecoration(color: Colors.black),
          padding: const EdgeInsets.all(6),
          child: const _InvoiceSummaryRow(
            label: "TOTAL :",
            value: "17100 XOD",
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Fature #25738", actionList: [
        IconButton(
          onPressed: (){},
          icon: const Icon(Iconsax.document_download),
        ),
        IconButton(
          onPressed: (){
            showMoreMenu(context);
          },
          icon: const Icon(Icons.more_vert_outlined),
        )
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            _buildInvoiceDetails(),
            const SizedBox(height: 30),
            _buildInvoiceTable(),
            const SizedBox(height: 30),
            _buildInvoiceSummary()
          ],
        ),
      ),
    );
  }


  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => const FullMenu(),
    );
  }

}



class _TableCell extends StatelessWidget {
  final String label;
  final bool isHeader;

  const _TableCell({required this.label, this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: isHeader ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}


class _InvoiceSummaryRow extends StatelessWidget {
  final String label, value;
  final Color? textColor;

  const _InvoiceSummaryRow({
    required this.label,
    required this.value,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildText(context, label, 14, textColor ?? Colors.black,
                 fontWeight: FontWeight.w300),
          const SizedBox(width: 8),
          buildText(context, value, 14, textColor ?? Colors.black,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}