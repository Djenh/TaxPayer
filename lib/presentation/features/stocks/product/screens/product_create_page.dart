import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/add_product_dto.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/unit_m_list_response.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/stocks/product/pricing/price_create.dart';
import 'package:invoice_app/presentation/features/stocks/product/taxgroup/tax_group.dart';
import 'package:invoice_app/presentation/features/stocks/product/unit-measurements/unit_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/logger_util.dart';

import '../../../../../core/configs/injection_container.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/product_ctrl.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/input_formaters.dart';
import '../category/screens/category_page.dart';



class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<ProductCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {

  final prodCtr = locator<ProductCtrl>();
  final formKey = GlobalKey<FormState>();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  bool goods = false;
  bool services = false;
  TextEditingController? codeController;
  TextEditingController? nameProdController;
  TextEditingController? nameOfficialProdController;
  TextEditingController? ctgController;
  TextEditingController? unitMController;
  TextEditingController? priceController;
  TextEditingController? taxGroupController;
  TextEditingController? taxSpController;
  String? codeCtg;
  String? codeUnit;
  String? codeTaxGp;
  Rx<String?> nameError = Rx<String?>(null);
  Rx<String?> nameOfficialError = Rx<String?>(null);

  void _showToast(String description) {
    ToastService.showWarning(context, 'Produit', description: description);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameProdController = TextEditingController();
    nameOfficialProdController = TextEditingController();
    ctgController = TextEditingController();
    unitMController = TextEditingController();
    priceController = TextEditingController();
    taxGroupController = TextEditingController();
    taxSpController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController?.dispose();
    nameProdController?.dispose();
    nameOfficialProdController?.dispose();
    ctgController?.dispose();
    unitMController?.dispose();
    priceController?.dispose();
    taxGroupController?.dispose();
    taxSpController?.dispose();
  }



  /// Fonction pour sélectionner une image
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  /// Fonction pour supprimer l'image avec animation
  void _deleteImage() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _selectedImage = null;
      });
    });
  }


  Widget _buildSelectionCard({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? KStyles.primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? KStyles.primaryColor : Colors.grey,
              size: 18,
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(context, title, 14,
                    isSelected ? KStyles.primaryColor : Colors.black,
                    fontWeight: FontWeight.w500),
                const SizedBox(height: 4),
                buildText(context, subtitle, 12,
                    isSelected ? KStyles.primaryColor : Colors.black,
                    fontWeight: FontWeight.w300),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getErrors() {
    nameError.value = NameVo.validate(nameProdController!.text.trim());
    //nameOfficialError.value = NameVo.validate(nameOfficialProdController!.text.trim());
  }

  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(nameProdController!.text.trim())) {
      return true;
    } else {
      return false;
    }
  }


  Future<void> _addProductByManage() async {
    String? tin =  AppServices.instance.currentCompany.value!.tin;
    String? posId =  AppServices.instance.currentPos.value!.code;

    AddProductDto params = AddProductDto(
        name: nameProdController!.text.trim(),
        officalProductNo: nameOfficialProdController!.text.trim(),
        categoryCode: codeCtg!,
        productType: goods ? "goods" : "services",
        companyTin: tin!,
        unitOfMeasurementCode: unitMController!.text.trim(),
        posCode: posId!
    );

    await prodCtr.addProduct(context, params).then((val) async {
      if(val != null){
        await Get.to(() => PriceCreate(prod: val),
            fullscreenDialog: true)?.then((vl){
          Get.back(result: true);
        });
      }
    });

  }

  Future<void> _addProductByNotManage() async {
    String? tin =  AppServices.instance.currentCompany.value!.tin;
    String? posId =  AppServices.instance.currentPos.value!.code;

    AddProductDto params = AddProductDto(
        name: nameProdController!.text.trim(),
        categoryCode: codeCtg!,
        productType: goods ? "goods" : "services",
        companyTin: tin!,
        posCode: posId!,
        amount: int.parse(priceController!.text.trim()),
        taxGroupCode: codeTaxGp,
        taxSpecific: int.parse(taxSpController!.text.trim())
    );

    AppLogger.info("params => ${params.toJson()}");

  }

  void onActionAdd() {
    if (!validate()) return;

    if (codeCtg == null) {
      _showToast('Veuillez sélectionner une catégorie');
      return;
    }

    if (widget.isManage) {
      if (codeUnit == null) {
        _showToast('Veuillez sélectionner une unité de mesure');
        return;
      }
      _addProductByManage();
    } else {
      if (priceController!.text.isEmpty) {
        _showToast('Veuillez renseigner le prix du produit');
        return;
      }
      if (codeTaxGp == null) {
        _showToast('Veuillez sélectionner un groupe de taxation');
        return;
      }
      if (taxSpController!.text.isEmpty) {
        _showToast('Veuillez renseigner la taxe spécifique');
        return;
      }
      _addProductByNotManage();
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Créer un produit"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Obx(() => IgnorePointer(
          ignoring: prodCtr.ignorePointer.isTrue,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
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
                            buildText(context, "Ajouter une image du produit",
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
                            icon: const Icon(Iconsax.trash,
                                color: Colors.red, size: 18),
                            onPressed: _deleteImage,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildSelectionCard(
                        title: "Biens",
                        subtitle: "Les tangibles",
                        isSelected: goods,
                        onTap: () {
                          setState(() {
                            goods = !goods;
                            services = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSelectionCard(
                        title: "Services",
                        subtitle: "Les immatériels",
                        isSelected: services,
                        onTap: () {
                          setState(() {
                            services = !services;
                            goods = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                /*TextFormField(
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
              const SizedBox(height: 20),*/
                TextFormField(
                  controller: nameProdController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  onChanged: (v) => nameError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                    labelText: "Nom du Produit", errorText: nameError.value
                    //prefixIcon: const Icon(Iconsax.clipboard)
                  ),
                ),
                const SizedBox(height: 20),
                if(widget.isManage)...[
                  TextFormField(
                    controller: nameOfficialProdController,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    //onChanged: (v) => nameOfficialError.value = null,
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: "Nom du officiel produit",
                        errorText: nameOfficialError.value
                      //prefixIcon: const Icon(Iconsax.clipboard)
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                TextFormField(
                  controller: ctgController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  inputFormatters: noSpaceNoEmoji,
                  onTap: () async {
                    await Get.to(() => const CategoryPage(isManage: true))?.then((val){
                      if(val is CategoriesEntities){
                        setState(() {
                          ctgController?.text = val.name!;
                          codeCtg = val.code;
                        });
                      }
                    });
                  },
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Categorie",
                      hintText: "Sélectionnez une catégorie",
                      //prefixIcon: const Icon(Iconsax.category_2),
                      suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 22)
                  ),
                ),
                const SizedBox(height: 20),
                if(widget.isManage)...[
                  TextFormField(
                    controller: unitMController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    inputFormatters: noSpaceNoEmoji,
                    onTap: () async {
                      await Get.to(() => const UnitPage())?.then((val){
                        if(val is UnitMEntities){
                          setState(() {
                            unitMController?.text = val.code!;
                            codeUnit = val.code;
                          });
                        }
                      });
                    },
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: "Unité de mesure",
                        hintText: "Sélectionnez une unité",
                        //prefixIcon: const Icon(Iconsax.category_2),
                        suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 42)
                    ),
                  )
                ],
                if(!widget.isManage)...[
                  TextFormField(
                    controller: priceController,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.number,
                    decoration: AppInputStyles.defaultInputDecoration(
                        labelText: "Prix",
                      //prefixIcon: const Icon(Iconsax.clipboard)
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: taxGroupController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          inputFormatters: noSpaceNoEmoji,
                          onTap: () async {
                            await Get.to(() => const TaxGroupPage())?.then((val){
                              if(val is TaxGroupEntities){
                                setState(() {
                                  taxGroupController?.text = val.name!;
                                  codeTaxGp = val.code;
                                });
                              }
                            });
                          },
                          decoration: AppInputStyles.defaultInputDecoration(
                              labelText: "Groupe de taxation",
                              hintText: "Sélectionnez une groupe",
                              //prefixIcon: const Icon(Iconsax.category_2),
                              suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 22)
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: TextFormField(
                          controller: taxSpController,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.number,
                          decoration: AppInputStyles.defaultInputDecoration(
                            labelText: "Taxe spécifique",
                            //prefixIcon: const Icon(Iconsax.clipboard)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 20),
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: prodCtr.isLoading.value ? 90 : 70,
        padding: const EdgeInsets.all(12),
        color: KStyles.primaryColor.withOpacity(0.2),
        child: ActionBtn(
          title: 'Ajouter',
          loading: prodCtr.isLoading,
          onPressed: (){
            onActionAdd();
          },
        ),
      ),
    );
  }


}
