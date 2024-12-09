import 'package:flutter/material.dart';

import '../../../../commons/ui/kTextgray.dart';

class TaxgroupPage extends StatelessWidget {
  const TaxgroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Les groupes de taxation"),
            KtextGray("Choisissez une des taxes applicables "),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          ListTile(
            leading: const CircleAvatar(
              child: Text("A"),
            ),
            title: const Text("Exonerés"),
            subtitle: const Text("Concerne les prooduits exonérés"),
            trailing: const Column(
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
            leading: const CircleAvatar(
              child: Text("B"),
            ),
            title: const Text("TAXABLE ( TVA)"),
            subtitle: const Text("Concerne les prooduits taxables "),
            trailing: const Column(
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
