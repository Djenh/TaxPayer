import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/simple_btn.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/result_verify_invoice_page.dart';

import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../res/app_input_styles.dart';
import '../../../../../res/input_formaters.dart';

class ManualCheckPage extends StatefulWidget {
  const ManualCheckPage({super.key});

  @override
  State<ManualCheckPage> createState() => _ManualCheckPageState();
}

class _ManualCheckPageState extends State<ManualCheckPage> {

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
                  const Flexible(
                    flex: 1,
                    child: Icon(Iconsax.scan_barcode, color: Colors.black,)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SimpleBtn(
          titleBtn: "Vérifier",
          sizeFont: 16,
          onPressed: (){
            /*showDialog(
              context: context,
              builder: (context) {
                return const ErrorScanDialog();
              },
            );*/
            Get.to(() => const ResultVerifyInvoicePage());
          },
        ),
      ),
    );
  }


}
