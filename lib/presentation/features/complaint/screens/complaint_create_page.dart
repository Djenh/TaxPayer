import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/product/categories_entities.dart';
import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/input_formaters.dart';
import '../../../res/style/e_style.dart';
import '../../stocks/product/category/screens/category_page.dart';
import '../widgets/rgpd_card.dart';




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


  Widget _buildBtnAddComplaint(){
    return Container(
      height: padding,
      color: Colors.white,



      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*Expanded(
                child: ActionBtn(
                    title: "Suivant",
                    loading: invCtr.isLoading,
                    onPressed: (){
                      //
                    }),
              ),*/
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }


  Widget step1Form(BuildContext ctx){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        buildText(ctx, "Nom du plaignant", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: padding),
        TextFormField(
          controller: nomPlaignantController,
          enabled: true,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        ),
        const SizedBox(height: padding),
        buildText(ctx, "Prénom du plaignant", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: padding),
        TextFormField(
          controller: prenomPlaignantController,
          enabled: true,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        ),
        const SizedBox(height: padding),
        buildText(ctx, "Téléphone du plaignant", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: padding),
        TextFormField(
          controller: telPlaignantController,
          enabled: true,
          keyboardType: TextInputType.phone,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        ),
        const SizedBox(height: padding),
        buildText(ctx, "Email du plaignant", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: padding),
        TextFormField(
          controller: emailPlaignantController,
          enabled: true,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        ),
      ],
    );
  }


  Widget step2Form(BuildContext ctx){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        buildText(ctx, "Catégorie", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: padding),
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
              // labelText: "Categorie",
              hintText: "Sélectionnez une catégorie",
              suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 22)
          ),
        ),
        const SizedBox(height: padding),
        Row(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  buildText(ctx, "Tin du contribuable", 14, Colors.black,
                      fontWeight: FontWeight.w300),
                  const SizedBox(height: padding),
                  TextFormField(
                    controller: tinContribuableController,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    inputFormatters: noSpaceNoEmoji,
                    decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
                  ),
                ],
              ),
            ),
            const SizedBox(width: padding),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  buildText(ctx, "Contribuable", 14, Colors.black,
                      fontWeight: FontWeight.w300),
                  const SizedBox(height: padding),
                  TextFormField(
                    controller: contribuableController,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    inputFormatters: noSpaceNoEmoji,
                    decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
                  ),
                ],
              )
            ),
          ],
        ),
        const SizedBox(height: padding),
        buildText(ctx, "Objet de la plainte", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: padding),
        TextFormField(
          controller: objetController,
          enabled: true,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        ),
        const SizedBox(height: padding),
        buildText(ctx, "Description", 14, Colors.black, fontWeight: FontWeight.w300),
        const SizedBox(height: padding),
        TextFormField(
          controller: descriptionController,
          enabled: true,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        ),
      ],
    );
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RgpdCard(
                  title: "Protection d'identité",
                  subTitle: "Votre plainte sera prise en compte et nous vous assurons \nque votre identité sera gardé dans l'anonymat conformément \naux dispositions de l'article 123"
              ),
              const SizedBox(height: padding,),
              Expanded(
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
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildBtnAddComplaint(),
      ),
    );
  }

}


