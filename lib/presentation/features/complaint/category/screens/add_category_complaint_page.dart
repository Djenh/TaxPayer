import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';

import '../../../../../../core/configs/injection_container.dart';
import '../../../../../data/dtos/complaint/add_category_complaint_dto.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/complaint_ctrl.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/style/e_style.dart';



class AddCategoryComplaintPage extends StatefulWidget {
  const AddCategoryComplaintPage({super.key});

  @override
  State<AddCategoryComplaintPage> createState() => _AddCategoryComplaintPageState();
}

class _AddCategoryComplaintPageState extends State<AddCategoryComplaintPage> {

  final complaintCtrl = locator<ComplaintCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? nameController;
  TextEditingController? descriptionController;
  Rx<String?> nameError = Rx<String?>(null);
  Rx<String?> descriptionError = Rx<String?>(null);


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    nameController?.dispose();
    descriptionController?.dispose();
  }


  void getErrors() {
    nameError.value = NameVo.validate(nameController!.text.trim());
    descriptionError.value = NameVo.validate(descriptionController!.text.trim());
  }


  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(nameController!.text.trim())
        && NameVo.isValid(descriptionController!.text.trim())) {
      return true;
    } else {
      return false;
    }
  }


  Future<void> _addCategory() async{
    AddCategoryComplaintDto params = AddCategoryComplaintDto(
        name: nameController!.text.trim(),
        description: descriptionController!.text.trim()
    );
    await complaintCtrl.addCategory(context, params).then((val){
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
          ignoring: complaintCtrl.ignorePointer.isTrue,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: padding20),
                TextFormField(
                  controller: nameController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  onChanged: (v) => nameError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Nom",
                      errorText: nameError.value),
                ),
                const SizedBox(height: padding20),
                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onChanged: (v) => descriptionError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Description",
                      errorText: descriptionError.value),
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
            loading: complaintCtrl.isLoading,
            onPressed:(){
              if (validate()) {
                _addCategory();
              }
            }
        ),
      ),
    );
  }
}
