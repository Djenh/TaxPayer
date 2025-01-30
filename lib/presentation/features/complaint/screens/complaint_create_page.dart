import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/configs/injection_container.dart';
import '../../../../core/services/toast_service.dart';
import '../../../../domain/entities/product/categories_entities.dart';
import '../../../_widgets/action_btn.dart';
import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../controllers/product_ctrl.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/input_formaters.dart';
import '../../../res/style/e_style.dart';
import '../../registration/_strings/register_str.dart';
import '../../stocks/product/category/screens/category_page.dart';
import '../widgets/rgpd_card.dart';
import 'complaint_end_create_page.dart';




class ComplaintCreatePage extends StatefulWidget {
  const ComplaintCreatePage({super.key});

  @override
  State<ComplaintCreatePage> createState() => _ComplaintCreatePageState();
}

class _ComplaintCreatePageState extends State<ComplaintCreatePage> {

  // final complaintCtr = locator<ComplaintCtrl>();
  int activeStep = 0;
  TextEditingController? categorieController;
  TextEditingController? nomPlaignantController;
  TextEditingController? prenomPlaignantController;
  TextEditingController? telPlaignantController;
  TextEditingController? emailPlaignantController;
  TextEditingController? tinContribuableController;
  TextEditingController? contribuableController;
  TextEditingController? objetController;
  TextEditingController? descriptionController;
  String? codeCategorie;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final prodCtr = locator<ProductCtrl>();

  @override
  void initState() {
    super.initState();
    categorieController = TextEditingController();
    nomPlaignantController = TextEditingController();
    prenomPlaignantController = TextEditingController();
    telPlaignantController = TextEditingController();
    emailPlaignantController = TextEditingController();
    tinContribuableController = TextEditingController();
    contribuableController = TextEditingController();
    objetController = TextEditingController();
    descriptionController = TextEditingController();


  }

  @override
  void dispose() {
    super.dispose();
    categorieController?.dispose();
    nomPlaignantController?.dispose();
    prenomPlaignantController?.dispose();
    telPlaignantController?.dispose();
    emailPlaignantController?.dispose();
    tinContribuableController?.dispose();
    contribuableController?.dispose();
    objetController?.dispose();
    descriptionController?.dispose();

  }


  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Plainte non enregistrée'),
            content: const Text(
              "Vous n'avez pas fini d'enregistrer la plainte. Etes-vous sûr de vouloir quitter ?",
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Continuer'),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Quitter'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        },
    );
  }

  Widget step1Form(BuildContext ctx){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: nomPlaignantController,
          enabled: true,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          textCapitalization: TextCapitalization.sentences,
          decoration: AppInputStyles.defaultInputDecoration(labelText: "Nom du plaignant"),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: prenomPlaignantController,
          enabled: true,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          textCapitalization: TextCapitalization.sentences,
          decoration: AppInputStyles.defaultInputDecoration(labelText: "Prénom du plaignant"),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: telPlaignantController,
          enabled: true,
          keyboardType: TextInputType.phone,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: "Téléphone"),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: emailPlaignantController,
          enabled: true,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: "Email"),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget step2Form(BuildContext ctx){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: categorieController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          onTap: () async {
            await Get.to(() => const CategoryPage(isManage: true))?.then((val){
              if(val is CategoriesEntities){
                setState(() {
                  categorieController?.text = val.name!;
                  codeCategorie = val.code;
                });
              }
            });
          },
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Categorie",
              hintText: "Sélectionnez une catégorie",
              suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 22)
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: tinContribuableController,
                enabled: true,
                keyboardType: TextInputType.text,
                inputFormatters: noSpaceNoEmoji,
                decoration: AppInputStyles.defaultInputDecoration(labelText: "Tin du contribuable"),
              ),
            ),
            const SizedBox(width: 15),
            Flexible(
              child: TextFormField(
                controller: contribuableController,
                enabled: true,
                keyboardType: TextInputType.text,
                inputFormatters: noSpaceNoEmoji,
                textCapitalization: TextCapitalization.sentences,
                decoration: AppInputStyles.defaultInputDecoration(labelText: "Contribuable"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: objetController,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          textCapitalization: TextCapitalization.sentences,
          decoration: AppInputStyles.defaultInputDecoration(labelText: "Objet de la plainte"),
        ),

        const SizedBox(height: 15),
        TextFormField(
          controller: descriptionController,
          enabled: true,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          inputFormatters: noSpaceNoEmoji,
          textCapitalization: TextCapitalization.sentences,
          decoration: AppInputStyles.defaultInputDecoration(labelText: "Description"),
        ),
        const SizedBox(height: 15),
        Stack(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _selectedImage == null
                  ? GestureDetector(
                onTap: _pickImage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.gallery_add, size: 40,
                        color: Colors.black),
                    const SizedBox(height: 8),
                    buildText(context, "Ajouter une image",
                        14, Colors.black, fontWeight: FontWeight.w400),
                  ],
                ),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            if (_selectedImage != null)
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.red.shade100,
                  radius: 18,
                  child: IconButton(
                    icon: const Icon(Iconsax.trash, color: Colors.red, size: 18),
                    onPressed: _deleteImage,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _deleteImage() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _selectedImage = null;
      });
    });
  }

  void _showToast(String description) {
    ToastService.showWarning(context, 'Plainte', description: description);
  }

  Future<bool> _verifyField() async {
    // ---to be implemented

    if (nomPlaignantController?.text == null) {
      _showToast('Veuillez remplir le nom du plaignant');
      return false;
    }

    if (prenomPlaignantController?.text == null) {
      _showToast('Veuillez remplir le prénom du plaignant');
      return false;
    }
    if (telPlaignantController?.text == null) {
      _showToast('Veuillez remplir le téléphone du plaignant');
      return false;
    }
    if (emailPlaignantController?.text == null) {
      _showToast("Veuillez remplir l'email du plaignant");
      return false;
    }
    return true;
    // ---to be implemented
  }





  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showBackDialog() ?? false;
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context, "Soumettre une plainte",
            actionList: [ ]
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const SizedBox(
               height: 90,
                child: RgpdCard(
                    title: RegisterStr.rgpdTitle,
                    subTitle: RegisterStr.rgpdSubTitle,
                ),
              ),
              const SizedBox(height: padding,),
              Expanded(
                child: Theme(
                  data: ThemeData(
                    canvasColor: Colors.white,
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: KStyles.primaryColor,
                    ),
                  ),
                  child: Stepper(
                    type : StepperType. horizontal,
                    currentStep: activeStep,
                    onStepCancel: () {
                      if (activeStep > 0) {
                        setState(() {
                          activeStep -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (activeStep <= 0) {
                        setState(() {
                          activeStep += 1;
                        });
                      }
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        activeStep = index;
                      });
                    },
                    controlsBuilder: (BuildContext context, ControlsDetails details) {
                      return
                        activeStep==0
                            ?ActionBtn(
                          title: 'Suivant',
                          loading: prodCtr.isLoading,
                          onPressed: details.onStepContinue,
                        )
                            :ActionBtn(
                            title: 'Valider',
                            loading: prodCtr.isLoading,
                            onPressed: () async {
                              // bool isFilled = await _verifyField();
                              bool isFilled = true;
                              if(isFilled){
                                Get.to(() => const ComplaintEndCreatePage());
                              }
                            }
                        );
                    },
                    steps: <Step>[
                      Step(
                        isActive: activeStep>=0,
                        title: const Text("Info du plaignant"),
                        content: step1Form(context),
                      ),
                      Step(
                        isActive: activeStep>=1,
                        title: const Text("Plainte"),
                        content: step2Form(context),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
