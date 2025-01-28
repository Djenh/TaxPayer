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


class AgencyPage extends StatefulWidget {
  const AgencyPage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<AgencyPage> createState() => _AgencyPageState();
}

class _AgencyPageState extends State<AgencyPage> {

  TextEditingController? searchController;
  final formKey = GlobalKey<FormState>();


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
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: KStyles.textLightColor.withOpacity(0.2),
            child: const Icon(Iconsax.user, color: KStyles.blackColor, size: 24),
          ),
          title: Text.rich(
            TextSpan(
                text: "Bonjour\n",
                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,),
                children: <TextSpan>[
                  TextSpan(text: "Byte Innov",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black),
                  )
                ]
            ),
          ),
          actions: [
              SizedBox(
                height: 40,
                width: 135,
                child: TextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  inputFormatters: noSpaceNoEmoji,
                  autofocus: false,
                  onTap: () async {},
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Agences",
                      // hintText: "Agences",
                      suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 24)
                  ),
                ),
              ),
              IconButton(
                  onPressed: () async {},
                  icon: const Icon(CupertinoIcons.camera_viewfinder,
                      color: KStyles.blackColor, size: 28)
              ),
              IconButton(
                  onPressed: () async {},
                  icon: const Icon(CupertinoIcons.add_circled_solid,
                      color: KStyles.primaryColor, size: 36)
              ),
            ]
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: (MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                            color: KStyles.fieldGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Icon(Iconsax.bank, color: KStyles.primaryColor, size: 36),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment : MainAxisAlignment.start,
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          Indicator(
                            shp: BoxShape.rectangle,
                            color: KStyles.yellowI,
                            wdt: 60,
                            hgt: 8,
                          ),
                          SizedBox(height: 8,),
                          Text("La Nationale",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w700, color: KStyles.primaryColor)
                          ),
                          SizedBox(height: 5,),
                          Text.rich(
                            TextSpan(
                                text: "Entreprise |",
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,),
                                children: <TextSpan>[
                                  TextSpan(text: "Actif",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: KStyles.primaryColor),
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                          onTap: (){},
                          child: Text("Voir détail",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: KStyles.primaryColor))
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          const TabBar(tabs: [
                            Tab(
                              text: "Statistiques",
                            ),
                            Tab(
                              text: "Agences",
                            ),
                            Tab(
                              text: "Rapport",
                            ),
                          ]),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: TabBarView(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(padding),
                                      child: Center(
                                        child: Text("Page des statistiques ..."),
                                      )
                                  ),
                                  Container(
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
                                                Text("Situation : 2025", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                                Text("10 agences"),
                                              ],
                                            ),
                                            Container(
                                              height: 50,
                                              width: 190,
                                              child: TextField(
                                                textInputAction: TextInputAction.done,
                                                keyboardType: TextInputType.text,
                                                inputFormatters: noSpaceNoEmoji,
                                                autofocus: false,
                                                onTap: () async {},
                                                decoration: AppInputStyles.defaultInputDecoration(
                                                    labelText: "Année 2025",
                                                    // hintText: "Année 2025",
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
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: KStyles.primaryColor,
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
                                                    Text("Chiffre d'affaires", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
                                                    Text("1 500 FCFA"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 85,
                                              width: 120,
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
                                                    Text("Factures", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
                                                    Text("200 000 FCFA"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 85,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: KStyles.textSecondaryColor,
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
                                                      backgroundColor: KStyles.textSecondaryColor,
                                                      child: const Icon(Iconsax.home, color: Colors.white, size: 18),
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text("Total Agence", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
                                                    Text("10"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Text(
                                          "Liste des agences",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.bodyLarge!
                                              .copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5,),
                                        Expanded(
                                          child: ListView(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            children: [
                                              SizedBox(height: padding,),
                                              ...ListTile.divideTiles(
                                                  color: Colors.grey,
                                                  tiles: List.generate(
                                                      10,
                                                          (index) => ListTile(
                                                        contentPadding: EdgeInsets.all(5),
                                                        subtitle: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("Nom de l'agence"),
                                                                Text("Agence N°${index+1}", style: TextStyle(fontWeight: FontWeight.bold),),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("Ville"),
                                                                Text("Cotonou", style: TextStyle(fontWeight: FontWeight.bold),),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("Chiffre d'affaire"),
                                                                Text("1.200.000", style: TextStyle(fontWeight: FontWeight.bold),),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        onTap: (){},
                                                      )
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(padding),
                                      child: Center(
                                        child: Text("Page des rapports ..."),
                                      )
                                  ),
                                ]
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          )
        ),
    );
  }
}
