import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';

import '../../../../../../core/configs/injection_container.dart';
import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../res/app_input_styles.dart';


class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {

  final prodCtr = locator<ProductCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? codeController;
  TextEditingController? nameProdController;
  Rx<String?> codeError = Rx<String?>(null);
  Rx<String?> nameError = Rx<String?>(null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameProdController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController?.dispose();
    nameProdController?.dispose();
  }


  void getErrors() {
    codeError.value = NameVo.validate(codeController!.text.trim());
    nameError.value = NameVo.validate(nameProdController!.text.trim());
  }


  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(codeController!.text.trim())
        && NameVo.isValid(nameProdController!.text.trim())) {
      return true;
    } else {
      return false;
    }
  }



  Future<void> _addCtg() async{
    AddCategoryDto params = AddCategoryDto(code: codeController!.text.trim(),
        name: nameProdController!.text.trim());
    await prodCtr.addCategory(context, params).then((val){
      if(val != null){
        Get.back(result: true);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Ajouter une catégorie"),
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
                  controller: nameProdController,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  //inputFormatters: noSpaceNoEmoji,
                  onChanged: (v) => nameError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Nom", errorText: nameError.value
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
                _addCtg();
              }
            }
        ),
      ),
    );
  }
}
