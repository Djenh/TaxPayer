import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/_widgets/simple_btn.dart';

import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../_widgets/build_text.dart';
import '../../../../../res/app_input_styles.dart';
import '../../../../../res/input_formaters.dart';

class ParticipateTombolaPage extends StatefulWidget {
  const ParticipateTombolaPage({super.key});

  @override
  State<ParticipateTombolaPage> createState() => _ParticipateTombolaPageState();
}

class _ParticipateTombolaPageState extends State<ParticipateTombolaPage> {


  final formKey = GlobalKey<FormState>();
  TextEditingController? referenceInvoiceController;
  TextEditingController? dateGiveInvoiceController;
  TextEditingController? taxpayerController;
  TextEditingController? taxpayerRepresentController;
  TextEditingController? taxpayerPhoneController;
  List<String> typeArray = ["Tirage1", "Tirage2", "Tirage3", "Tirage4"];
  String? selectType;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    referenceInvoiceController = TextEditingController();
    dateGiveInvoiceController = TextEditingController();
    taxpayerController = TextEditingController();
    taxpayerRepresentController = TextEditingController();
    taxpayerPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    referenceInvoiceController?.dispose();
    dateGiveInvoiceController?.dispose();
    taxpayerController?.dispose();
    taxpayerRepresentController?.dispose();
    taxpayerPhoneController?.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Participer au tombola", actionList: []),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Type de tirage"),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: AppInputStyles.dropDownInputDecoration1(),
                    value: null,
                    items: typeArray.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: buildText(context, value, 14, Colors.black, fontWeight: FontWeight.w500),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // TODO : Ajouter la logique pour la sélection
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text("Référence de la facture"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: referenceInvoiceController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    inputFormatters: noSpaceNoEmoji,
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: ""),
                  ),
                  const SizedBox(height: 10),
                  const Text("Date d'émission de la facture"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: dateGiveInvoiceController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.datetime,
                    inputFormatters: noSpaceNoEmoji,
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: ""),
                  ),
                  const SizedBox(height: 10),
                  const Text("Contribuable"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: taxpayerController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    inputFormatters: noSpaceNoEmoji,
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: ""),
                  ),
                  const SizedBox(height: 10),
                  const Text("Représentant du contribuable"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: taxpayerRepresentController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    inputFormatters: noSpaceNoEmoji,
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: ""),
                  ),
                  const SizedBox(height: 10),
                  const Text("Téléphone du contribuable"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: taxpayerPhoneController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    inputFormatters: noSpaceNoEmoji,
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: ""),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SimpleBtn(
                      titleBtn: "Participer au tirage",
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
