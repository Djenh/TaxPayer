import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/configs/injection_container.dart';
import '../../../_widgets/action_btn.dart';
import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../controllers/product_ctrl.dart';
import '../../../res/style/e_style.dart';
import 'complaint_detail_page.dart';
import 'complaint_page.dart';




class ComplaintEndCreatePage extends StatefulWidget {
  const ComplaintEndCreatePage({super.key});

  @override
  State<ComplaintEndCreatePage> createState() => _ComplaintEndCreatePageState();
}

class _ComplaintEndCreatePageState extends State<ComplaintEndCreatePage> {

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
                Get.to(() => const ComplaintPage());
              },
            ),
          ],
        );
      },
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
          Get.to(() => const ComplaintPage());
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildText(context, "Félicitations",
                  18, Colors.black, fontWeight: FontWeight.w700),
              const SizedBox(height: padding,),
              buildText(context, "Votre plainte a été bien envoyée avec succès. Copier le numéro de votre dossier afin de suivre l'évolution de votre plainte",
                  15, Colors.black, fontWeight: FontWeight.w400, maxLine:4, textAlign: TextAlign.center),
              const SizedBox(height: padding,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 75,
                      padding: const EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                          color: KStyles.primaryColor.withOpacity(0.4),
                          border: Border.all(
                              width: 1,
                              color: KStyles.primaryColor.withOpacity(0.4),
                              strokeAlign: BorderSide.strokeAlignCenter),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildText(context, "N° de la plainte",
                              15, Colors.black, fontWeight: FontWeight.w500),
                          const SizedBox(height: padding),
                          buildText(context, "1528-252-ZS74",
                              16, Colors.black, fontWeight: FontWeight.w700),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                      child: ActionBtn(
                        title: 'Suivre ma plainte',
                        loading: prodCtr.isLoading,
                        onPressed: ()=> Get.to(() => const ComplaintDetailPage()),
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
