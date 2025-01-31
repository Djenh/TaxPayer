import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/result_verify_invoice_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/scan_verify_page.dart';

import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../res/app_input_styles.dart';
import '../../../../../res/input_formaters.dart';

class ManualCheckPage extends StatefulWidget {
  const ManualCheckPage({super.key});

  @override
  State<ManualCheckPage> createState() => _ManualCheckPageState();
}

class _ManualCheckPageState extends State<ManualCheckPage> {

  final invCtr = locator<InvoiceCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? verifyController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    verifyController?.dispose();
  }


  Future<void> _verifyInvoice() async {
    String sig = verifyController!.text.trim();
    await invCtr.invoiceVerify(context, sig, true).then((val){
      if(val != null){
        Get.to(() => ResultVerifyInvoicePage(dataInvoice: val));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Vérification de facture", actionList: []),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Form(
              key: formKey,
              child: Row(
                children: [
                  Flexible(
                    flex: 8,
                    child: TextFormField(
                        controller: verifyController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        inputFormatters: noSpaceNoEmoji,
                        decoration: AppInputStyles.defaultInputDecoration(
                          labelText: "Entrer la signature de la facture",
                          hintText: "Signature de la facture"
                        ),
                      )
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Get.to(() => const ScanVerifyPage()),
                    child: const Flexible(
                      flex: 1,
                      child: Icon(Iconsax.scan_barcode, color: Colors.black,)
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ActionBtn(
          title: "Vérifier",
          loading: invCtr.isLoading,
          onPressed: (){
            if(verifyController!.text.isNotEmpty){
              _verifyInvoice();
            }else{
              ToastService.showWarning(context, "Vérification Facture",
                  description: "Veuillez renseignez la signature de la facture");
            }
          },
        ),
      ),
    );
  }


}
