import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../core/configs/injection_container.dart';
import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../controllers/product_ctrl.dart';
import '../../../res/style/e_style.dart';
import '../../sales/invoice/screens/verify_invoice/manual_check_page.dart';



class ComplaintDetailPage extends StatefulWidget {

  const ComplaintDetailPage({super.key});

  @override
  State<ComplaintDetailPage> createState() => _ComplaintDetailPageState();
}

class _ComplaintDetailPageState extends State<ComplaintDetailPage> {

  // final complaintCtr = locator<ComplaintCtrl>();
  final prodCtr = locator<ProductCtrl>();

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
                Get.offAll(() => const ManualCheckPage());
              },
            ),
          ],
        );
      },
    );
  }


  Widget cardPlainte(String title, String date, String heure, Color? color)
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
          Get.offAll(() => const ManualCheckPage());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context, "Soumettre une plainte",
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
              Expanded(
                child: Timeline.tileBuilder(
                  theme: TimelineTheme.of(context).copyWith(
                    nodePosition: 0,
                  ),
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (context, index) => cardPlainte(
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