import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../../../../res/style/e_style.dart';


class TaxGroupPage extends StatefulWidget {
  const TaxGroupPage({super.key});

  @override
  State<TaxGroupPage> createState() => _TaxGroupState();
}

class _TaxGroupState extends State<TaxGroupPage> {

  final List<Map<String, String>> tax = const [
    {"letter": "A", "name": "Exonerés", "desc": "Concerne les produits exonérés", "taux" : "0%"},
    {"letter": "B", "name": "Taxable (TVA)", "desc": "Concerne les produits exonérés", "taux" : "18%"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Choisir une taxation"),
      body: ListView.separated(
        itemCount: tax.length,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(
              height: 1, thickness: 1),
        ),
        itemBuilder: (BuildContext context, int cst){
          final dat = tax[cst];

          return GestureDetector(
            onTap: (){
              Get.back(result: dat["name"]);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: KStyles.primaryColor.withOpacity(0.2),
                    child: Text(
                      dat["letter"]!,
                      style: const TextStyle(color: KStyles.primaryColor, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(context, dat["name"]!, 14, Colors.black,
                            fontWeight: FontWeight.w700),
                        const SizedBox(height: 4),
                        buildText(context, dat["desc"]!, 12, Colors.black,
                            fontWeight: FontWeight.w300)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildText(context, "Taux", 14, Colors.black,
                              fontWeight: FontWeight.w500),
                          const SizedBox(height: 4),
                          buildText(context, dat["taux"]!, 12, Colors.black,
                              fontWeight: FontWeight.w300),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

