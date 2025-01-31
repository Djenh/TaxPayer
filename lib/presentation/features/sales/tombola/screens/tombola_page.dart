import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/sales/tombola/screens/tombola_detail_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/product_ctrl.dart';



class TombolaPage extends StatefulWidget {
  const TombolaPage({super.key});

  @override
  State<TombolaPage> createState() => _TombolaPageState();
}

class _TombolaPageState extends State<TombolaPage> {

  // final tombolaCtr = locator<TombolaCtrl>();
  final prodCtr = locator<ProductCtrl>();
  List<Map<String, dynamic>>? listParticipation =
  [
    {'reference': 'IHok7059642',
      'type': 'Tombola ABY',
      'statut': "En attente"
    },
    {'reference': 'IHok7059642',
      'type': 'Tombola ABY',
      'statut': "Gagnant"
    },
    {'reference': 'IHok7059642',
      'type': 'Tombola ABY',
      'statut': "Non gagnant"
    },
    {'reference': 'IHok7059642',
      'type': 'Tombola ABY',
      'statut': "Non gagnant"
    },
    {'reference': 'IHok7059642',
      'type': 'Tombola ABY',
      'statut': "Gagnant"
    },
    {'reference': 'IHok7059642',
      'type': 'Tombola ABY',
      'statut': "En attente"
    },
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildStatutTombola(String statut)
  {
    if(statut.toLowerCase().startsWith("en"))
    {
      return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: KStyles.textLightColor.withOpacity(0.2),
          foregroundColor: KStyles.textLightColor,
          side: const BorderSide(color: KStyles.textLightColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:  const Text("En attente", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),),
      );
    }
    else if(statut.toLowerCase().startsWith("gagn"))
    {
      return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: KStyles.secondaryColor.withOpacity(0.2),
          foregroundColor: KStyles.secondaryColor,
          side: const BorderSide(color: KStyles.secondaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:  const Text("Gagnant", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),),
      );
    }
    else
    {
      return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: KStyles.dangerColor.withOpacity(0.2),
          foregroundColor: KStyles.dangerColor,
          side: const BorderSide(color: KStyles.dangerColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:  const Text("Non gagnant", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),),
      );
    }
  }


  Widget buildParticipateTombola(Map<String, dynamic> tombola)
  {
    return InkWell(
      onTap: () => Get.to(() => TombolaDetailPage(tombola: tombola)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: buildText(context, "Réf facture", 10, KStyles.textLightColor, fontWeight: FontWeight.w400),
              ),
              Flexible(
                flex: 1,
                child: buildText(context, "Type de tirage", 10, KStyles.textLightColor, fontWeight: FontWeight.w400),
              ),
              Flexible(
                flex: 2,
                child: buildText(context, "Statut", 10, KStyles.textLightColor, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: padding5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: buildText(context, tombola["reference"]??"", 12,
                    KStyles.blackColor, fontWeight: FontWeight.w600),
              ),
              Flexible(
                flex: 1,
                child: buildText(context, tombola["type"]??"", 12,
                    KStyles.blackColor, fontWeight: FontWeight.w600),
              ),
              Flexible(
                flex: 1,
                child: buildStatutTombola(tombola["statut"]),
              ),
            ],
          ),
          const SizedBox(height: padding5),
          const Divider(),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHome(context, "Tombola",
          actionList: [],
          bgColor: Colors.white
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
        child: Column(
          children: [
            buildText(context, "Liste de participation", 15, Colors.black, fontWeight: FontWeight.w700),
            const SizedBox(height: padding,),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listParticipation!.length,
              itemBuilder: (BuildContext context, int idx){
                return buildParticipateTombola(listParticipation![idx]);
              },
            ),
          ],
        ),
      ),
    );
  }

}
