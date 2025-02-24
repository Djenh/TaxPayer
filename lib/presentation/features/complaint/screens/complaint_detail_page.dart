import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../core/configs/injection_container.dart';
import '../../../../domain/entities/complaint/complaint_data_response.dart';
import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../controllers/lottery_ctrl.dart';
import '../../../res/style/e_style.dart';
import 'complaint_page.dart';



class ComplaintDetailPage extends StatefulWidget {

  const ComplaintDetailPage({super.key, required this.complaint});

  final ComplaintDataResponse complaint;

  @override
  State<ComplaintDetailPage> createState() => _ComplaintDetailPageState();
}

class _ComplaintDetailPageState extends State<ComplaintDetailPage> {

  final lotteryCtrl = locator<LotteryCtrl>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Plainte enregistrée'),
          content: const Text(
            "Voulez-vous retourner à la liste des plaintes ?",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Non'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Oui'),
              onPressed: () {
                // Navigator.pop(context, true);
                Get.offAll(() => const ComplaintPage());
              },
            ),
          ],
        );
      },
    );
  }


  Widget buildPlainteInfo(ComplaintDataResponse plainte)
  {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
          // color: KStyles.primaryColor.withOpacity(0.3),
          border: Border.all(
              width: 1,
              color: KStyles.primaryColor.withOpacity(0.8),
              strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: KStyles.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: buildText(
                      context, plainte.category?.name??"", 11, KStyles.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Flexible(
                flex: 1,
                child: buildText(context, plainte.status??"", 12,
                    KStyles.blackColor, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: padding),
          buildText(context, plainte.subject??"", 12, maxLine: 3,
              KStyles.blackColor, fontWeight: FontWeight.w500),
          const SizedBox(height: padding),
          buildText(context, plainte.content??"", 12, maxLine: 3,
              KStyles.blackColor, fontWeight: FontWeight.w500),
          Expanded(
              child: buildText(context, "@${plainte.concernName??""}", 12,
                  KStyles.blackColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }


  Widget cardSuiviPlainte(String title, String date, String heure, Color? color)
  {
    return Container(
        // height: 70,
        padding: const EdgeInsets.all(padding),
        margin: const EdgeInsets.symmetric(horizontal: padding, vertical: padding20),
        decoration: BoxDecoration(
            color: color?.withOpacity(0.2)??KStyles.primaryColor.withOpacity(0.2),
            border: Border.all(
                width: 1,
                color: color??KStyles.primaryColor,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(context, title, 14, Colors.black,
                  fontWeight: FontWeight.w600, maxLine: 8),
              const SizedBox(height: padding5,),
              Row(
                children: [
                  const Icon(Iconsax.clock, size:15, color: KStyles.textSecondaryColor),
                  const SizedBox(width: padding5),
                  Flexible(child: Text("$date ,$heure", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black))),
                ],
              ),
            ],
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showBackDialog() ?? false;
        if (context.mounted && shouldPop) {
          // Navigator.pop(context);
          Get.offAll(() => const ComplaintPage());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context, "Plainte info",
            actionList: [ ]
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(context, "Suivre ma plainte",
                  18, Colors.black, fontWeight: FontWeight.w700),
              const SizedBox(height: padding,),
              buildPlainteInfo(widget.complaint),
              const SizedBox(height: padding20,),
              Expanded(
                child: Timeline.tileBuilder(
                  theme: TimelineTheme.of(context).copyWith(
                    nodePosition: 0,
                  ),
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (context, index) => cardSuiviPlainte(
                        ComplaintData._data[index]['title']!,
                        ComplaintData._data[index]['date']!,
                        ComplaintData._data[index]['heure']!,
                        ComplaintData._data[index]['color']!
                    ),
                    connectorStyle: ConnectorStyle.dashedLine,
                    endConnectorStyle: ConnectorStyle.solidLine,
                    indicatorStyle: IndicatorStyle.dot,
                    itemCount: ComplaintData._data.length,
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ComplaintData {
  static const List<Map<String, dynamic>> _data = [
    {
      'date': '08 Avril 2024',
      'heure': '14:00',
      'title': "Plainte traitée, nous vous contactez en privé pour avoir plus d'informations",
      'color': KStyles.violetColor,
    },
    {
      'date': '04 Avril 2024',
      'heure': '09:00',
      'title': 'Plainte en cours de traitement',
      'color': KStyles.primaryColor,
    },
    {
      'date': '04 Avril 2024',
      'heure': '08:00',
      'title': 'Plainte envoyée',
      'color': KStyles.violetColor,
    },
  ];
}