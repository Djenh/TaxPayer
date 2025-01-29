import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_create_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../_widgets/app_bar_custom.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/input_formaters.dart';
import '../../registration/_widgets/indicator.dart';


class AgencyDetailPage extends StatefulWidget {
  AgencyDetailPage({super.key});

  @override
  State<AgencyDetailPage> createState() => _AgencyDetailPageState();
}

class _AgencyDetailPageState extends State<AgencyDetailPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor : Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.2),
          leading:
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  );
                },
              ),
            ],
          ),
          title: Text.rich(
            TextSpan(
                text: "Agence N°1",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 17,),
                children: <TextSpan>[
                  TextSpan()
                ]
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {},
              child: Text('Active', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
              style: OutlinedButton.styleFrom(
                backgroundColor: KStyles.secondaryColor.withOpacity(0.2),
                foregroundColor: KStyles.secondaryColor,
                side: BorderSide(color: KStyles.secondaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(width: padding,),
          ]
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: (MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 15),
                  child: Container(
                    height: 150,
                    width: (MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: KStyles.textLightColor,
                            strokeAlign: BorderSide.strokeAlignCenter),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 150,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: KStyles.textLightColor.withOpacity(0.5),
                                    border: Border.all(
                                        width: 1,
                                        color: KStyles.textLightColor.withOpacity(0.5),
                                        strokeAlign: BorderSide.strokeAlignCenter),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text.rich(
                                    TextSpan(
                                        text: "Agence N°1\n",
                                        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 17,),
                                        children: <TextSpan>[
                                          TextSpan(text: "Cotonou",
                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                                          )
                                        ]
                                    ),
                                  ),
                                )
                              ),
                              Container(
                                  width: 150,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: KStyles.textLightColor.withOpacity(0.5),
                                      border: Border.all(
                                          width: 1,
                                          color: KStyles.textLightColor.withOpacity(0.5),
                                          strokeAlign: BorderSide.strokeAlignCenter),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text.rich(
                                      TextSpan(
                                          text: "1.200.000\n",
                                          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 17,),
                                          children: <TextSpan>[
                                            TextSpan(text: "Chiffre d'affaire",
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                                            )
                                          ]
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                          const SizedBox(height: padding,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                      Icons.email_outlined, size:18, color: KStyles.textSecondaryColor
                                  ),
                                  const SizedBox(width: 5,),
                                  Text("stmichel@gmail.com", style: TextStyle(fontSize: 15))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                      Icons.phone, size:18, color: KStyles.textSecondaryColor
                                  ),
                                  const SizedBox(width: 5,),
                                  Text("+229 01 97 01 01 40", style: TextStyle(fontSize: 15))
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: padding,),
                          Row(
                            children: [
                              Icon(
                                  Icons.map_outlined, size:18, color: KStyles.textSecondaryColor
                              ),
                              const SizedBox(width: 5,),
                              Text("En face de la banque ByteBank", style: TextStyle(fontSize: 15))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: padding),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Point des affaires", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                Text("Situation sur les 6 derniers mois", style: TextStyle(fontSize: 13),),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              child: TextField(
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                inputFormatters: noSpaceNoEmoji,
                                autofocus: false,
                                onTap: () async {},
                                decoration: AppInputStyles.defaultInputDecoration(
                                    labelText: "Semestre",
                                    // hintText: "Semestre",
                                    prefixIcon: const Icon(Icons.filter_alt_outlined, size: 24),
                                    suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 24)
                                ),
                              ),
                            ),
                          ],

                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 85,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: KStyles.primaryColor.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1,
                                      color: KStyles.primaryColor.withOpacity(0.5),
                                      strokeAlign: BorderSide.strokeAlignCenter),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: KStyles.primaryColor,
                                      child: const Icon(Iconsax.wallet, color: Colors.white, size: 18),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("Factures", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
                                    Text("203"),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 85,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: KStyles.secondaryColor,
                                      strokeAlign: BorderSide.strokeAlignCenter),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: KStyles.secondaryColor,
                                      child: const Icon(Iconsax.bill, color: Colors.white, size: 18),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("Recettes", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
                                    Text("140B FCFA"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Les factures",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('Créer une facture'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.grey,
                                side: BorderSide(color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              SizedBox(height: padding,),
                              ...List.generate(
                                  10,
                                      (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: padding),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: padding / 2, vertical: padding),
                                      decoration: const BoxDecoration(color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CircleAvatar(
                                            radius: padding * 2.7,
                                            child: Center(
                                              child: Icon(Iconsax.bill),
                                            ),
                                          ),
                                          const SizedBox(width: padding),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Jorge Maso",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                                                Text("FA #80903Biy",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text("400 000 XOF", style: TextStyle(color: Colors.black)),
                                                Text("10/11/2024; 10:00"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
