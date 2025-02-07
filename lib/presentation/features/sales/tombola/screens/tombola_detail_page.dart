import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/complaint/screens/complaint_page.dart';
import 'package:invoice_app/presentation/features/sales/tombola/screens/participate_tombola_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../../utils/custom_image_view.dart';
import '../../../../_widgets/action_btn.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/product_ctrl.dart';
import '../../../../res/assets/app_assets.dart';



class TombolaDetailPage extends StatefulWidget {
  const TombolaDetailPage({super.key, required this.tombola});

  final Map<String, dynamic> tombola;

  @override
  State<TombolaDetailPage> createState() => _TombolaDetailPageState();
}

class _TombolaDetailPageState extends State<TombolaDetailPage> {

  // final tombolaCtr = locator<TombolaCtrl>();
  final prodCtr = locator<ProductCtrl>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Widget textTombola(String title, String detail)
  {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(fontSize: 15, color: KStyles.textSecondaryColor,
            fontWeight: FontWeight.w400),
        children: <TextSpan>[
          const TextSpan(text: " : ",
              style: TextStyle(fontSize: 15, color: KStyles.textSecondaryColor,
                  fontWeight: FontWeight.w400)),
          TextSpan(text: detail,
              style: const TextStyle(fontSize: 15, color: KStyles.blackColor,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Tombola / Facture ${widget.tombola["reference"]}",actionList: []),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(context, "Détails de la facture en jeu",
                16, Colors.black, fontWeight: FontWeight.w600),
            const SizedBox(height: padding,),
            Container(
              padding: const EdgeInsets.all(padding),
              decoration: BoxDecoration(
                  color: KStyles.secondaryColor.withOpacity(0.1),
                  border: Border.all(
                      width: 1,
                      color: KStyles.secondaryColor,
                      strokeAlign: BorderSide.strokeAlignCenter),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: KStyles.secondaryColor.withOpacity(0.8),
                            border: Border.all(
                                width: 1,
                                color: KStyles.secondaryColor.withOpacity(0.8),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            borderRadius: BorderRadius.circular(8)
                        ),
                      child: CustomImageView(
                        onTap: (){},
                        height: 90,
                        width: 100,
                        imagePath: $appAssets.imgs.imgWinTombola,
                        fit: BoxFit.contain,
                      ),
                      ),
                      Column(
                        children: [
                          textTombola("Statut", widget.tombola["statut"]),
                          const SizedBox(height: padding,),
                          textTombola("Référence", widget.tombola["reference"]),
                          const SizedBox(height: padding,),
                          textTombola("Lot gagné", "Moto Haoujoue"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: padding20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Type de facture", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, "Facture de vente", 13, KStyles.blackColor,
                    fontWeight: FontWeight.w700),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Nombre d'article", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, "10", 13, KStyles.blackColor,
                    fontWeight: FontWeight.w700),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Montant de la facture", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, "179 108 000 FCFA", 13,KStyles.blackColor,
                    fontWeight: FontWeight.w700),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                    child: ActionBtn(
                      title: "Réclamer le lot gagné",
                      loading: prodCtr.isLoading,
                      onPressed: ()=> Get.to(() => const ComplaintPage()),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
