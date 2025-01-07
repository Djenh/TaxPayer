import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';

import '../../../../../../core/configs/injection_container.dart';
import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../res/app_input_styles.dart';
import '../../../../../res/input_formaters.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {

  final prodCtr = locator<ProductCtrl>();
  TextEditingController? codeController;
  TextEditingController? nameProdController;


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
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: codeController,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              inputFormatters: noSpaceNoEmoji,
              decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "Code",
                  prefixIcon: const Icon(Iconsax.note_2)
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameProdController,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              inputFormatters: noSpaceNoEmoji,
              decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "Nom",
                  prefixIcon: const Icon(Iconsax.clipboard)
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(12),
        child: ActionBtn(
            title: "Ajouter",
            loading: prodCtr.isLoading,
            onPressed:(){
              _addCtg();
            }
        ),
      ),
    );
  }
}
