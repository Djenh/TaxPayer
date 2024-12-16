import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../../../../res/style/e_style.dart';


class SecurityTaxPage extends StatefulWidget {
  const SecurityTaxPage({super.key});

  @override
  State<SecurityTaxPage> createState() => _SecurityTaxPageState();
}

class _SecurityTaxPageState extends State<SecurityTaxPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Map<String, String>> taxTypes = const [
    {"letter": "A", "title": "AIB(1%)", "description": "les factures de vente permettent d’encaisser un paiement"},
    {"letter": "B", "title": "AIB(1.5%)", "description": "les factures d’avoir permettent de payer un avoir"},
    {"letter": "C", "title": "AIB(3%)", "description": "les factures de TVA permettent de payer une taxe"},
    {"letter": "D", "title": "AIB(5%)", "description": "les factures de remboursement permettent d’annuler un paiement"},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Taxes de sécurité"),
      body: ListView.separated(
        itemCount: taxTypes.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(height: 1, thickness: 1),
        ),
        itemBuilder: (BuildContext context, int typ){
          final tax = taxTypes[typ];

          return ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: KStyles.primaryColor,
              child: Text(
                tax["letter"]!,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              tax["title"]!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              tax["description"]!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              // TODO : Ajouter l'action lors du choix d'une facture
              debugPrint("Type sélectionné : ${tax["title"]}");
              Get.back(result: "${tax["title"]}");
            },
          );
        },
      ),
    );
  }


}
