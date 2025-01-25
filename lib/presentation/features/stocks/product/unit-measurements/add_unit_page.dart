import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/data/dtos/add_unit_dto.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';

class AddUnitPage extends StatefulWidget {
  const AddUnitPage({super.key});

  @override
  State<AddUnitPage> createState() => _AddUnitPageState();
}

class _AddUnitPageState extends State<AddUnitPage> {

  final prodCtr = locator<ProductCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? codeController;
  TextEditingController? nameUnitController;
  TextEditingController? descUnitController;
  Rx<String?> codeError = Rx<String?>(null);
  Rx<String?> nameError = Rx<String?>(null);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameUnitController = TextEditingController();
    descUnitController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController?.dispose();
    nameUnitController?.dispose();
    descUnitController?.dispose();
  }


  void getErrors() {
    codeError.value = NameVo.validate(codeController!.text.trim());
    nameError.value = NameVo.validate(nameUnitController!.text.trim());
  }


  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(codeController!.text.trim())
        && NameVo.isValid(nameUnitController!.text.trim())) {
      return true;
    } else {
      return false;
    }
  }




  Future<void> _addUnit() async{
    AddUnitDto params = AddUnitDto(code: codeController!.text.trim(),
        name: nameUnitController!.text.trim(),
        description: descUnitController!.text.trim());

    await prodCtr.addUnitM(context, params).then((val){
      if(val != null){
        Get.back(result: true);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Ajouter une unité de mesure"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Obx(() => IgnorePointer(
          ignoring: prodCtr.ignorePointer.isTrue,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: codeController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  //inputFormatters: noSpaceNoEmoji,
                  onChanged: (v) => codeError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                    labelText: "Code", errorText: codeError.value
                    //prefixIcon: const Icon(Iconsax.note_2)
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameUnitController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  //inputFormatters: noSpaceNoEmoji,
                  onChanged: (v) => nameError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                    labelText: "Nom", errorText: nameError.value
                    //prefixIcon: const Icon(Iconsax.clipboard)
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: descUnitController,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  //inputFormatters: noSpaceNoEmoji,
                  decoration: AppInputStyles.defaultInputDecoration(
                    labelText: "Description",
                    //prefixIcon: const Icon(Iconsax.clipboard)
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(12),
        child: ActionBtn(
            title: "Ajouter",
            loading: prodCtr.isLoading,
            onPressed:(){
              if (validate()) {
                _addUnit();
              }
            }
        ),
      ),
    );
  }
}
