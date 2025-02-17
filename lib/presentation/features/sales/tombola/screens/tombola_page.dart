import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/sales/tombola/screens/tombola_detail_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../../domain/entities/lottery/lottery_participation_response.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/lottery_ctrl.dart';



class TombolaPage extends StatefulWidget {
  const TombolaPage({super.key});

  @override
  State<TombolaPage> createState() => _TombolaPageState();
}

class _TombolaPageState extends State<TombolaPage> {

  final lotteryCtrl = locator<LotteryCtrl>();
  List<LotteryParticipationResponse> dataList = [];


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDataLotteryParticipation();
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getDataLotteryParticipation() async {
    await lotteryCtrl.dataListLotteryParticipation().then((val){
      dataList = val ?? [];
      setState(() {});
    });
  }

  Future<void> _refreshData() async {
    if(dataList.isNotEmpty){
      dataList.clear();
    }
    _getDataLotteryParticipation();
    setState(() {});
  }


  Widget buildStatutTombola(String statut)
  {
    if(statut.toLowerCase().startsWith("en"))
    {
      return Container(
          padding: const EdgeInsets.all(padding),
          width: 90,
          decoration: BoxDecoration(
              color: KStyles.textLightColor.withOpacity(0.2),
              border: Border.all(
                  width: 1,
                  color: KStyles.textLightColor,
                  strokeAlign: BorderSide.strokeAlignCenter),
              borderRadius: BorderRadius.circular(8)
          ),
        child: const Text("En attente", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal,
              color:KStyles.textLightColor),),
      );
    }
    else if(statut.toLowerCase().startsWith("gagn"))
    {
      return Container(
        padding: const EdgeInsets.all(padding),
        width: 90,
        decoration: BoxDecoration(
            color: KStyles.secondaryColor.withOpacity(0.2),
            border: Border.all(
                width: 1,
                color: KStyles.secondaryColor,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(8)
        ),
        child: const Text("Gagnant", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal,
              color:KStyles.secondaryColor),),
      );
    }
    else
    {
      return Container(
        padding: const EdgeInsets.all(padding),
        width: 90,
        decoration: BoxDecoration(
            color: KStyles.dangerColor.withOpacity(0.2),
            border: Border.all(
                width: 1,
                color: KStyles.dangerColor,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(8)
        ),
        child: const Text("Non gagnant", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal,
              color:KStyles.dangerColor),),
      );
    }
  }


  Widget buildParticipateTombola(LotteryParticipationResponse tombola)
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
                flex: 1,
                child: buildText(context, "Réf facture", 11, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ),
              /*Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: buildText(context, "Type de tirage", 11, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ),*/
              Flexible(
                flex: 1,
                child: buildText(context, "Statut", 11, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: padding5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: buildText(context, tombola.invoice?.uuid??"", 12,
                    KStyles.blackColor, fontWeight: FontWeight.w600),
              ),
              /*Flexible(
                flex: 1,
                child: buildText(context, tombola["type"]??"", 12,
                    KStyles.blackColor, fontWeight: FontWeight.w600),
              ),*/
              Flexible(
                flex: 1,
                child: buildStatutTombola(tombola.status??""),
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
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _refreshData()),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(context, "Liste de participation au tombola", 16, Colors.black, fontWeight: FontWeight.w700),
                const SizedBox(height: padding20,),
                (dataList.isEmpty)
                    ? const Center(child: Text("Aucune participation à un tombola !"))
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int idx){
                    return buildParticipateTombola(dataList[idx]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
