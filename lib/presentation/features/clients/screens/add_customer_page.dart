import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';

import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/simple_btn.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/input_formaters.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController? fullNameController;
  TextEditingController? ifuController;
  TextEditingController? rcmController;
  TextEditingController? adrController;
  TextEditingController? phoneController;
  Rx<String?> nameError = Rx<String?>(null);
  Rx<String?> ifuError = Rx<String?>(null);



  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    ifuController = TextEditingController();
    ifuController?.addListener(() {
      if (ifuController!.text.length > 13) {
        ifuController!.text = ifuController!.text.substring(0, 13);
        ifuController!.selection = TextSelection.fromPosition(
          TextPosition(offset: ifuController!.text.length),
        );
      }
    });
    rcmController = TextEditingController();
    adrController = TextEditingController();
    phoneController = TextEditingController();
  }


  @override
  void dispose() {
    fullNameController?.dispose();
    ifuController?.dispose();
    rcmController?.dispose();
    adrController?.dispose();
    phoneController?.dispose();
    super.dispose();
  }


  void getErrors() {
    nameError.value = NameVo.validate(fullNameController!.text.trim());
  }

  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(fullNameController!.text.trim())){
      //TODO : implement action
      return true;
    } else {
      return false;
    }
  }


  Widget _buildBtnAddCustomer(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: SimpleBtn(titleBtn: "Ajouter", sizeFont: 16,
            onPressed: (){}),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Ajouter un Client"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: fullNameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                //inputFormatters: noSpaceNoEmoji,
                onChanged: (String v) => nameError.value = null,
                decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "Nom du client",
                  errorText: nameError.value,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: ifuController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: noSpaceNoEmoji,
                onChanged: (String v) => ifuError.value = null,
                decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "IFU client",
                  errorText: ifuError.value,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: rcmController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                inputFormatters: noSpaceNoEmoji,
                decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "RCCM client"
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: adrController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                inputFormatters: noSpaceNoEmoji,
                decoration: AppInputStyles.defaultInputDecoration(
                    labelText: "Adresse client"
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: phoneController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                inputFormatters: noSpaceNoEmoji,
                decoration: AppInputStyles.defaultInputDecoration(
                    labelText: "Téléphone client"
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBtnAddCustomer(),
    );
  }


}
