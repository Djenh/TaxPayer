import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/commons/ui/button/kcirclebutton.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/enums/type_customer_enum.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/add_customer_dto.dart';
import 'package:invoice_app/data/dtos/address_dto.dart';
import 'package:invoice_app/data/dtos/contact_dto.dart';
import 'package:invoice_app/domain/entities/company/localities_list_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/value_objects/email_vo.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/localities_paginated_searchable_dropdown.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/controllers/customer_ctrl.dart';
import 'package:invoice_app/presentation/features/clients/screens/customer_category_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../_widgets/app_bar_custom.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/input_formaters.dart';

class AddCustomerPage extends StatefulWidget {
  final bool isInvoice;
  const AddCustomerPage({super.key,required this.isInvoice});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {

  final customerCtr = locator<CustomerCtrl>();
  final companyCtr = locator<CompanyCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? fullNameController;
  TextEditingController? tinController;
  TextEditingController? ctgController;
  String? codeCtg;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  TextEditingController? urlWebController;
  TextEditingController? localityController;
  String? codeLocalities;
  TextEditingController? latitudeController;
  TextEditingController? longitudeController;
  Rx<String?> fullNameError = Rx<String?>(null);
  //Rx<String?> tinError = Rx<String?>(null);
  Rx<String?> phoneError = Rx<String?>(null);
  Rx<String?> emailError = Rx<String?>(null);
  List<CustomerType> get customerTypes => CustomerType.values;
  CustomerType? _selectedCustomerType;





  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    tinController = TextEditingController();
    ctgController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    urlWebController = TextEditingController();
    localityController = TextEditingController();
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();

  }


  @override
  void dispose() {
    fullNameController?.dispose();
    tinController?.dispose();
    ctgController?.dispose();
    phoneController?.dispose();
    emailController?.dispose();
    urlWebController?.dispose();
    localityController?.dispose();
    latitudeController?.dispose();
    longitudeController?.dispose();
    super.dispose();
  }



  void getErrors() {
    fullNameError.value = NameVo.validate(fullNameController!.text.trim());
    //tinError.value = NameVo.validate(tinController!.text.trim());
    phoneError.value = NameVo.validate(phoneController!.text.trim());
    emailError.value = EmailVo.validate(emailController!.text.trim());
  }

  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(fullNameController!.text.trim())
        && NameVo.isValid(phoneController!.text.trim()) &&
        NameVo.isValid(emailController!.text.trim())){
      //TODO : implement action
      return true;
    } else {
      return false;
    }
  }


  Widget _buildTitleBlocInfo(String title, {bool? isAction}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, title, 14, Colors.black),
        if(isAction== true)
          Obx(() => customerCtr.isLoadingLoc.isTrue
              ? const CircularProgressIndicator()
              :
          TextButton(
            onPressed: (){
              customerCtr.getCurrentLocation().then((val){
                if(val != null){
                  latitudeController!.text = val.latitude.toString();
                  longitudeController!.text = val.longitude.toString();
                  setState(() {});
                }
              });
            },
            child: buildText(context, "Obtenir les données map", 14,
                Colors.blue),
          ))
      ],
    );
  }

  Widget _buildFormFieldIdentification(){
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextFormField(
                controller: tinController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                //onChanged: (String v) => tinError.value = null,
                decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "Tin du client",
                  //errorText: tinError.value
                ),
              ),
            ),
            const SizedBox(width: 20),
            KCircleButton(
              color: KStyles.primaryColor,
              onPressed: () async{
                if(tinController!.text.isNotEmpty) {
                  await companyCtr.dataCompanyByTin(context, tinController!.text.trim(),showLoader: true).then((val){
                    if(val != null){
                      setState(() {
                        fullNameController!.text = val.name??"";
                        phoneController!.text = val.contact?.phoneNumber??"";
                        emailController!.text = val.contact?.email??"";
                        urlWebController!.text = val.contact?.websiteUrl??"";
                      });
                    }
                  });
                }else{
                  ToastService.showError(context, 'Attention', description: "Veuillez entrer un Tin");
                }

              },
              child: const Icon(Icons.verified_outlined,color: Colors.white, size: 25),
            ),
          ],
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: fullNameController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.characters,
          //inputFormatters: noSpaceNoEmoji,
          onChanged: (String v) => fullNameError.value = null,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Nom du client",
              errorText:fullNameError.value
          ),
        ),
        const SizedBox(height: 30),

        DropdownButtonFormField<CustomerType>(
          value: _selectedCustomerType,
          hint: buildText(context, "Sélectionnez un type de client", 14, Colors.black),
          decoration: AppInputStyles.dropDownInputDecoration1(),
          onChanged: (CustomerType? newValue) {
            setState(() {
              _selectedCustomerType = newValue;
            });
            debugPrint('Type de client sélectionné : $newValue');
          },
          items: customerTypes.map<DropdownMenuItem<CustomerType>>((CustomerType type) {
            return DropdownMenuItem<CustomerType>(
              value: type,
              child: buildText(context, getCustomerTypeLabel(type), 14, Colors.black),
            );
          }).toList(),
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: ctgController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          onTap: () async {
            await Get.to(() => const CustomerCategoryPage())?.then((val){
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
      ],
    );
  }

  Widget _buildFormFieldContact(){
    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormField(
          controller: phoneController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          onChanged: (String v) => phoneError.value = null,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Téléphone",
              errorText:phoneError.value
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          onChanged: (String v) => emailError.value = null,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Email",
              errorText: emailError.value
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: urlWebController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.url,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Lien de site web"),
        ),
      ],
    );
  }

  Widget _buildFormFieldAddress(){
    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormField(
          controller: localityController,
          readOnly: true,
          enabled: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: AppInputStyles.defaultInputDecoration(
            labelText: "Renseignez une localité",
          ),
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              isScrollControlled: true,
              builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: const LocalitiesPaginatedSearchableDropdown(),
              ),
            ).then((val){
              if(val is LocalitiesEntities){
                localityController?.text = val.name!;
                codeLocalities = val.code;
                setState(() {});
              }
            });
          },
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: latitudeController,
          readOnly: true,
          enabled: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Latitude"),
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: longitudeController,
          readOnly: true,
          enabled: true,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Longitude"),
        ),
      ],
    );
  }


  Future<void> _addCustomer() async {
    String? tin =  AppServices.instance.currentCompany.value!.tin;

    AddCustomerDto params = AddCustomerDto(
        name: fullNameController!.text.trim(),
        typeClient: _selectedCustomerType!.name,
        categoryCode: codeCtg!,
        ownerTin: tin!,
        contact: ContactDto(phoneNumber: phoneController!.text.trim(),
            email: emailController!.text.trim()),
        invoicingAddress: AddressDto(localityCode: codeLocalities!,
            gps: GpsDto(latitude: double.parse(latitudeController!.text.trim()),
                longitude: double.parse(longitudeController!.text.trim())))
    );

    if(tinController!.text.isNotEmpty){
      params.tin = tinController!.text.trim();
    }

    await customerCtr.addCustomerForCompany(context, params).then((val) async {
      if(val != null){
        if(widget.isInvoice){
          Get.back(result: val);
        }else{
          Get.back(result: true);
        }
      }
    });

  }

  Widget _buildBtnAddCustomer(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ActionBtn(
          title: 'Ajouter',
          loading: customerCtr.isLoading,
          onPressed: (){
            if (validate()) {
             _addCustomer();
            }
          },
        ),
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
        child: Obx(() => IgnorePointer(
          ignoring: customerCtr.ignorePointer.isTrue,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _buildTitleBlocInfo("Identification"),
                _buildFormFieldIdentification(),
                const SizedBox(height: 30),
                _buildTitleBlocInfo("Contact"),
                _buildFormFieldContact(),
                const SizedBox(height: 30),
                _buildTitleBlocInfo("Adresse", isAction: true),
                _buildFormFieldAddress(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: _buildBtnAddCustomer(),
    );
  }


}
