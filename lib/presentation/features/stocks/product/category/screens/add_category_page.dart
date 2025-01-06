import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../_widgets/simple_btn.dart';
import '../../../../../res/app_input_styles.dart';
import '../../../../../res/input_formaters.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {

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
        child: SimpleBtn(
            titleBtn: "Ajouter",
            sizeFont: 16,
            onPressed:(){}),
      ),
    );
  }
}
