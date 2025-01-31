import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/sales/tombola/screens/participate_tombola_end_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/action_btn.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/product_ctrl.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/input_formaters.dart';



class ParticipateTombolaPage extends StatefulWidget {
  const ParticipateTombolaPage({super.key});

  @override
  State<ParticipateTombolaPage> createState() => _ParticipateTombolaPageState();
}

class _ParticipateTombolaPageState extends State<ParticipateTombolaPage> {

  // final tombolaCtr = locator<TombolaCtrl>();
  final prodCtr = locator<ProductCtrl>();
  Map<String, dynamic> factureData =
    {'reference': 'RefiO56798413651',
      'type': 'Facture de vente',
      'nbrArticle': 10,
      'montant': "179 108 000 FCFA",
      'dateEmission': "12/10/2024"
    };
  final formKey = GlobalKey<FormState>();
  TextEditingController? nomController;
  TextEditingController? telController;

  @override
  void initState() {
    super.initState();
    nomController = TextEditingController();
    telController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nomController?.dispose();
    telController?.dispose();
  }


  Widget buildRecap()
  {
    return Container(
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
                buildText(context, "Référence de la facture", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, factureData["reference"], 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Type de facture", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, factureData["type"], 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Nombre d'article", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, factureData["nbrArticle"], 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Montant de la facture", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, factureData["montant"], 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Date d'émission", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, factureData["dateEmission"], 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
              ],
            ),
          ],
        ),
    );
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
        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRecap(),
            const SizedBox(height: padding,),
            Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nomController,
                      enabled: true,
                      keyboardType: TextInputType.text,
                      inputFormatters: noSpaceNoEmoji,
                      decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Nom du participant"),
                    ),
                    TextFormField(
                      controller: telController,
                      enabled: true,
                      keyboardType: TextInputType.text,
                      inputFormatters: noSpaceNoEmoji,
                      decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Téléphone du participant"),
                    ),
                    const SizedBox(height: padding20,),
                    ActionBtn(
                        title: "Participer au tirage",
                        loading: prodCtr.isLoading,
                        onPressed: () async {
                          // --- to be implemented
                          Get.to(() => const ParticipateTombolaEndPage());
                        }
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

}
