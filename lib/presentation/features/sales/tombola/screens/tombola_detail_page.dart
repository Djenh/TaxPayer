import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/action_btn.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/product_ctrl.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/input_formaters.dart';
import '../../invoice/screens/verify_invoice/participate_tombola_page.dart';



class TombolaDetailPage extends StatefulWidget {
  TombolaDetailPage({super.key, required this.tombola});

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHome(context, "Participer au tombola",
          actionList: [],
          bgColor: Colors.white
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(context, "Détails de la facture en jeu",
                18, Colors.black, fontWeight: FontWeight.w700),
            const SizedBox(height: padding,),
            Container(
              // height: 75,
              padding: const EdgeInsets.all(padding),
              decoration: BoxDecoration(
                  color: KStyles.textSecondaryColor.withOpacity(0.4),
                  border: Border.all(
                      width: 1,
                      color: KStyles.textSecondaryColor.withOpacity(0.4),
                      strokeAlign: BorderSide.strokeAlignCenter),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Type de facture", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, "Facture de vente", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Nombre d'article", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, "10", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Montant de la facture", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, "179 108 000 FCFA", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                    child: ActionBtn(
                      title: "Réclamer le lot gagné",
                      loading: prodCtr.isLoading,
                      onPressed: ()=> Get.to(() => ParticipateTombolaPage()),
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
