import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  final formKey = GlobalKey<FormState>();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  Rx<String?> nameError = Rx<String?>(null);
  Rx<String?> phoneError = Rx<String?>(null);
  Rx<String?> emailError = Rx<String?>(null);


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController?.dispose();
    phoneController?.dispose();
    emailController?.dispose();
  }


  Widget buildRecap() {
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
                const SizedBox(height: padding5,),
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
    nameError.value = NameVo.validate(nameController!.text.trim());
    phoneError.value = NameVo.validate(phoneController!.text.trim());
    emailError.value = EmailVo.validate(emailController!.text.trim());
  }

  bool validateForm() {
    final FormState? form = formKey.currentState;
    getErrorsForm();
    if (form!.validate() && NameVo.isValid(nameController!.text.trim())
        && NameVo.isValid(phoneController!.text.trim())
        && NameVo.isValid(emailController!.text.trim()))
    {
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
                      controller: nameController,
                      enabled: true,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      onChanged: (String v) => nameError.value = null,
                      decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Nom du participant",
                          errorText: nameError.value),
                    ),
                    const SizedBox(height: padding20,),
                    TextFormField(
                      controller: phoneController,
                      enabled: true,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      inputFormatters: noSpaceNoEmoji,
                      onChanged: (String v) => phoneError.value = null,
                      decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Téléphone du participant",
                          errorText: phoneError.value),
                    ),
                    const SizedBox(height: padding20,),
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
                    const SizedBox(height: 30,),
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

  int convertToDate(String issueDate)
  {
    if (issueDate=="") return 0;
    /*int millis=0;
    millis = (issueDate=="")?0:int.parse(issueDate);
    var dt = DateTime.fromMillisecondsSinceEpoch(millis);
    var d24 = DateFormat('dd/MM/yyyy').format(dt);*/

    var dt = DateFormat('d/M/y').parse(issueDate);
    int d24 = dt.millisecondsSinceEpoch;

    return d24;
  }


  Future<void> _addLottery() async {
    String signatureInvoice = widget.dataInvoice.signatureData?.signature?.toString()??"";
    num numTotalInvoice = widget.dataInvoice.total?.ttc??0;
    int totalInvoice = numTotalInvoice.toInt();
    String issuedDate = widget.dataInvoice.signatureData?.certifiedDate?.toString()??"";

    int milliseconds = convertToDate(issuedDate);

    AddLotteryDto params = AddLotteryDto(
      signature: signatureInvoice,
      issuedDateTimestamp: milliseconds,
      participant: nameController!.text.trim(),
      phone: phoneController!.text.trim(),
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
