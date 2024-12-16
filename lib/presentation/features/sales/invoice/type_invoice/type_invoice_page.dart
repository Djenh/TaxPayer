import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';



class TypeInvoicePage extends StatefulWidget {
  const TypeInvoicePage({super.key});

  @override
  State<TypeInvoicePage> createState() => _TypeInvoicePageState();
}

class _TypeInvoicePageState extends State<TypeInvoicePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Map<String, String>> invoiceTypes = const [
    {"letter": "A", "title": "Facture de vente", "description": "les factures de vente permettent d’encaisser un paiement"},
    {"letter": "B", "title": "Facture d’avoir", "description": "les factures d’avoir permettent de payer un avoir"},
    {"letter": "C", "title": "Facture de TVA", "description": "les factures de TVA permettent de payer une taxe"},
    {"letter": "D", "title": "Facture de remboursement", "description": "les factures de remboursement permettent d’annuler un paiement"},
    {"letter": "E", "title": "Facture de récapitulatif", "description": "les factures de récapitulatif permettent de regrouper plusieurs paiements"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Choisir un type de facture"),
      body: ListView.separated(
        itemCount: invoiceTypes.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(height: 1, thickness: 1),
        ),
        itemBuilder: (BuildContext context, int typ){
          final invoice = invoiceTypes[typ];

          return ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: KStyles.primaryColor,
              child: Text(
                invoice["letter"]!,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              invoice["title"]!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              invoice["description"]!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              // TODO : Ajouter l'action lors du choix d'une facture
              debugPrint("Type sélectionné : ${invoice["title"]}");
              Get.back(result: "${invoice["title"]}");
            },
          );
        },
      ),
    );
  }

}
