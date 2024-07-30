import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kTextgray.dart';

class TaxgroupPage extends StatelessWidget {
  const TaxgroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Les groupes de taxation"),
            KtextGray("Choisissez une des taxes applicables "),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          ListTile(
            leading: CircleAvatar(
              child: Text("A"),
            ),
            title: Text("Exonerés"),
            subtitle: Text("Concerne les prooduits exonérés"),
            trailing: Column(
              children: [
                Text("Taux"),
                SizedBox(
                  height: 5.0,
                ),
                KtextGray("0%"),
              ],
            ),
            onTap: () {
              Navigator.pop(context,"result");
            },

          ),
          ListTile(
            onTap: () {
              Navigator.pop(context,"result");
            },
            leading: CircleAvatar(
              child: Text("B"),
            ),
            title: Text("TAXABLE ( TVA)"),
            subtitle: Text("Concerne les prooduits taxables "),
            trailing: Column(
              children: [
                Text("Taux"),
                SizedBox(
                  height: 5.0,
                ),
                KtextGray("18%"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
