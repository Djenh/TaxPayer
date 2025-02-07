import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/sales/tombola/screens/participate_tombola_end_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../../data/dtos/add_lottery_dto.dart';
import '../../../../../domain/entities/invoice/invoice_response.dart';
import '../../../../../domain/value_objects/email_vo.dart';
import '../../../../../domain/value_objects/name_vo.dart';
import '../../../../../utils/utils.dart';
import '../../../../_widgets/action_btn.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/lottery_ctrl.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/input_formaters.dart';



class ParticipateTombolaPage extends StatefulWidget {
  const ParticipateTombolaPage({super.key, required this.dataInvoice});

  final InvoiceResponse dataInvoice;

  @override
  State<ParticipateTombolaPage> createState() => _ParticipateTombolaPageState();
}

class _ParticipateTombolaPageState extends State<ParticipateTombolaPage> {

  final lotteryCtrl = locator<LotteryCtrl>();
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
  TextEditingController? emailController;
  Rx<String?> nomError = Rx<String?>(null);
  Rx<String?> telError = Rx<String?>(null);
  Rx<String?> emailError = Rx<String?>(null);


  @override
  void initState() {
    super.initState();
    nomController = TextEditingController();
    telController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nomController?.dispose();
    telController?.dispose();
    emailController?.dispose();
  }


  Widget buildRecap()
  {
    return Container(
        padding: const EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: KStyles.fieldGrey.withOpacity(0.4),
          border: Border.all(
          width: 1,
          color: KStyles.fieldGrey.withOpacity(0.4),
          strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Référence de la facture", 13,
                    KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                Expanded(
                    child: buildText(context, widget.dataInvoice.invoice?.code??"", 13,
                        KStyles.blackColor, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Type de facture", 13,
                    KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context,
                    widget.dataInvoice.invoice?.typeInvoice?.name??"", 13,
                    KStyles.blackColor, fontWeight: FontWeight.w700),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Nombre d'article", 13,
                    KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context, "${widget.dataInvoice.invoice?.items?.length}",
                    13, KStyles.blackColor, fontWeight: FontWeight.w700),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Montant de la facture", 13,
                    KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context,
                    Utils.getFormattedAmount(widget.dataInvoice.total?.ttc??0),
                    13, KStyles.blackColor, fontWeight: FontWeight.w700),
              ],
            ),
            const SizedBox(height: padding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Date d'émission", 13, KStyles.textSecondaryColor, fontWeight: FontWeight.w400),
                buildText(context,
                    widget.dataInvoice.signatureData?.certifiedDate?.toString()??"00/00/2025",
                    13, KStyles.blackColor, fontWeight: FontWeight.w700),
              ],
            ),
          ],
        ),
    );
  }


  void getErrorsForm() {
    nomError.value = NameVo.validate(nomController!.text.trim());
    telError.value = NameVo.validate(telController!.text.trim());
    emailError.value = EmailVo.validate(emailController!.text.trim());
  }

  bool validateForm() {
    final FormState? form = formKey.currentState;
    getErrorsForm();
    if (form!.validate() && NameVo.isValid(nomController!.text.trim())
        && NameVo.isValid(telController!.text.trim())
        && NameVo.isValid(emailController!.text.trim())){

      return true;
    } else {
      return false;
    }
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
            const SizedBox(height: padding20,),
            Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nomController,
                      enabled: true,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      onChanged: (String v) => nomError.value = null,
                      decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Nom du participant",
                          errorText: nomError.value),
                    ),
                    const SizedBox(height: padding,),
                    TextFormField(
                      controller: telController,
                      enabled: true,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      inputFormatters: noSpaceNoEmoji,
                      onChanged: (String v) => telError.value = null,
                      decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Téléphone du participant",
                          errorText: telError.value),
                    ),
                    const SizedBox(height: padding,),
                    TextFormField(
                      controller: emailController,
                      enabled: true,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: noSpaceNoEmoji,
                      onChanged: (String v) => emailError.value = null,
                      decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Email du participant",
                          errorText: emailError.value),
                    ),
                    const SizedBox(height: padding20,),
                    Row(
                      children: [
                        Expanded(
                          child: ActionBtn(
                              title: "Participer au tirage",
                              loading: lotteryCtrl.isLoading,
                              onPressed: (){
                                if (validateForm()) {
                                  _addLottery();
                                }
                              }
                          ),
                        )
                      ],
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _addLottery() async {
    String signatureInvoice = widget.dataInvoice.signatureData?.signature?.toString()??"";
    num numTotalInvoice = widget.dataInvoice.total?.ttc??0;
    int totalInvoice = numTotalInvoice.toInt();
    String heure = widget.dataInvoice.signatureData?.certifiedDate?.toString()??"";

    AddLotteryDto params = AddLotteryDto(
      signature: signatureInvoice,
      issuedDateTimestamp: 0,
      participant: nomController!.text.trim(),
      phone: telController!.text.trim(),
      email: emailController!.text.trim(),
      totalInvoice: totalInvoice
    );

    await lotteryCtrl.addLotteryForParticipant(context, params).then((val) async {
      if(val != null){
        Get.to(() => const ParticipateTombolaEndPage());
      }
    });

  }

}
