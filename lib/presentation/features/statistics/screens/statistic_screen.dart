import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/kstatisticcard.dart';
import 'package:invoice_app/presentation/features/statistics/screens/card_business_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BusinessCard(
          chiffreAffaire: "1 Milliard Fcfa",
          invoiceAmount: "1 Million Fcfa",
          totalAgency: "05",
        ),
        const SizedBox(
          height: padding,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: KStatisticard(
                    title: "32",
                    subTitle:  "Achats",
                    onPressed: (){

                    },
                    height: 80,
                  ),
                ),
                const SizedBox(
                  width: padding,
                ),
                Expanded(
                  child: KStatisticard(
                    title: "12",
                    subTitle:  "Taxe",
                    onPressed: (){

                    },
                    height: 80,
                  ),
                ),
                const SizedBox(
                  width: padding,
                ),
                Expanded(
                  child: KStatisticard(
                    height: 80,
                    title: "10",
                    subTitle:  "Clients",
                    onPressed: (){

                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: KStyles.dropDownBorderColor)
              ),
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Chiffres d’affaires",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: KStyles.blackColor),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => KStyles.primaryColor),
                            headingTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            columns: const [
                              DataColumn(label: Text("MOIS",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))),
                              DataColumn(label: Text("NBRE FACTURE",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))),
                              DataColumn(label: Text("TOTAL",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))),
                            ],
                            rows: List.generate(
                              data.length,
                                  (index) => DataRow(cells: [
                                DataCell(Text(data[index]["mois"])),
                                DataCell(Text(data[index]["nbre_facture"].toString())),
                                DataCell(Text(data[index]["total"])),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        )
      ],
    );
  }
  List<Map<String, dynamic>> data = [
    {"mois": "Janvier", "nbre_facture": 100, "total": "120K"},
    {"mois": "Février", "nbre_facture": 120, "total": "62M"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Janvier", "nbre_facture": 100, "total": "120K"},
    {"mois": "Février", "nbre_facture": 120, "total": "62M"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Janvier", "nbre_facture": 100, "total": "120K"},
    {"mois": "Février", "nbre_facture": 120, "total": "62M"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Janvier", "nbre_facture": 100, "total": "120K"},
    {"mois": "Février", "nbre_facture": 120, "total": "62M"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Janvier", "nbre_facture": 100, "total": "120K"},
    {"mois": "Février", "nbre_facture": 120, "total": "62M"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Janvier", "nbre_facture": 100, "total": "120K"},
    {"mois": "Février", "nbre_facture": 120, "total": "62M"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
    {"mois": "Mars", "nbre_facture": 60, "total": "12K"},
  ];
}
