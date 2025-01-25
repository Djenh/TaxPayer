import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/pricing_dto.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/features/stocks/product/taxgroup/tax_group.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';



class PriceCreate extends StatefulWidget {
  const PriceCreate({super.key, required this.prod});

  final ProductResponse prod;

  @override
  State<PriceCreate> createState() => _PriceCreateState();
}

class _PriceCreateState extends State<PriceCreate> {

  //final prodCtr = locator<ProductCtrl>();
  final invCtr = locator<InvoiceCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? priceController;
  TextEditingController? taxGroupController;
  String? codeTaxGroup;
  TextEditingController? taxSpecifController;
  Rx<String?> priceError = Rx<String?>(null);
  Rx<String?> taxSError = Rx<String?>(null);
  bool ttc = false;
  bool ht = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    priceController = TextEditingController();
    taxGroupController = TextEditingController();
    taxSpecifController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    priceController?.dispose();
    taxGroupController?.dispose();
    taxSpecifController?.dispose();
  }


  void getErrors() {
    priceError.value = NameVo.validate(priceController!.text.trim());
    taxSError.value = NameVo.validate(taxSpecifController!.text.trim());
  }


  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(priceController!.text.trim())
        && NameVo.isValid(taxSpecifController!.text.trim())) {
      return true;
    } else {
      return false;
    }
  }


  Widget _buildSelectionCard({required String title, required bool isSelected,
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
            buildText(context, title, 14,
                isSelected ? KStyles.primaryColor : Colors.black,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }


  Future<void> _addPrice() async {
    PricingDto params = PricingDto(
        amount: int.parse(priceController!.text.trim()),
        productCode: widget.prod.code!,
        taxGroupCode: codeTaxGroup!,
        taxSpecific: int.parse(taxSpecifController!.text.trim()),
        priceDefinitionMode: ttc ? "TTC" : "HT"
    );

    await invCtr.addPriceProd(context, params, nameProd: widget.prod.name).then((val){
      if(val != null){
        Get.back();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Ajout du prix"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Obx(() => IgnorePointer(
          ignoring: invCtr.ignorePointer.isTrue,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                buildText(context, "Produit : ${widget.prod.name}", 16,
                    Colors.black, textAlign: TextAlign.start),
                const SizedBox(height: 20),
                TextFormField(
                  controller: priceController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (v) => priceError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Prix", errorText: priceError.value
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: taxGroupController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onTap: () async {
                    await Get.to(() => const TaxGroupPage())?.then((val){
                      if(val is TaxGroupEntities){
                        setState(() {
                          taxGroupController?.text = val.name!;
                          codeTaxGroup = val.code;
                        });
                      }
                    });
                  },
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Groupe de taxation",
                      hintText: "Sélectionnez un groupe",
                      //prefixIcon: const Icon(Iconsax.category_2),
                      suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 42)
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: taxSpecifController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  //inputFormatters: noSpaceNoEmoji,
                  onChanged: (v) => taxSError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                      labelText: "Taxe Spécifique", errorText: taxSError.value
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildSelectionCard(
                        title: "TTC",
                        isSelected: ttc,
                        onTap: () {
                          setState(() {
                            ttc = !ttc;
                            ht = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSelectionCard(
                        title: "HT",
                        isSelected: ht,
                        onTap: () {
                          setState(() {
                            ht = !ht;
                            ttc = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: 75,
        padding: const EdgeInsets.all(12),
        child: ActionBtn(
            title: "Ajouter",
            loading: invCtr.isLoading,
            onPressed:(){
              if (validate()) {
                if(codeTaxGroup == null){
                  ToastService.showWarning(context, 'Prix',
                      description: "Veuillez selectionnez un groupe de taxation");
                }else {
                  _addPrice();
                }
              }
            }
        ),
      ),
    );
  }


}

