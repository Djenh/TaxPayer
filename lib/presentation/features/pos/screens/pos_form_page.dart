import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/data/dtos/add_pos_dto.dart';
import 'package:invoice_app/data/dtos/address_dto.dart';
import 'package:invoice_app/data/dtos/contact_dto.dart';
import 'package:invoice_app/domain/entities/company/localities_list_response.dart';
import 'package:invoice_app/domain/value_objects/email_vo.dart';
import 'package:invoice_app/domain/value_objects/name_vo.dart';
import 'package:invoice_app/presentation/_widgets/action_btn.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/controllers/customer_ctrl.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';

import '../../../_widgets/localities_paginated_searchable_dropdown.dart';

class PosFormPage extends StatefulWidget {
  const PosFormPage({super.key});

  @override
  State<PosFormPage> createState() => _PosFormPageState();
}

class _PosFormPageState extends State<PosFormPage> {

  final companyCtr = locator<CompanyCtrl>();
  final customerCtr = locator<CustomerCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? nameAgencyController;
  TextEditingController? descAgencyController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  TextEditingController? urlWebController;
  TextEditingController? localityController;
  String? codeLocalities;
  TextEditingController? latitudeController;
  TextEditingController? longitudeController;
  Rx<String?> nameError = Rx<String?>(null);
  Rx<String?> descError = Rx<String?>(null);
  Rx<String?> phoneError = Rx<String?>(null);
  Rx<String?> emailError = Rx<String?>(null);



  @override
  void initState() {
    super.initState();
    nameAgencyController = TextEditingController();
    descAgencyController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    urlWebController = TextEditingController();
    localityController = TextEditingController();
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();

  }


  @override
  void dispose() {
    nameAgencyController?.dispose();
    descAgencyController?.dispose();
    phoneController?.dispose();
    emailController?.dispose();
    urlWebController?.dispose();
    localityController?.dispose();
    latitudeController?.dispose();
    longitudeController?.dispose();
    super.dispose();
  }


  void getErrors() {
    nameError.value = NameVo.validate(nameAgencyController!.text.trim());
    descError.value = NameVo.validate(descAgencyController!.text.trim());
    phoneError.value = NameVo.validate(phoneController!.text.trim());
    emailError.value = EmailVo.validate(emailController!.text.trim());
  }

  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && NameVo.isValid(nameAgencyController!.text.trim())
        && NameVo.isValid(descAgencyController!.text.trim())
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
              : TextButton(
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
        TextFormField(
          controller: nameAgencyController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.characters,
          //inputFormatters: noSpaceNoEmoji,
          onChanged: (String v) => nameError.value = null,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Nom de l'agence",
              errorText: nameError.value
          ),
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
          controller: descAgencyController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          //inputFormatters: noSpaceNoEmoji,
          onChanged: (String v) => descError.value = null,
          decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Description",
              errorText: descError.value
          ),
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

  Future<void> _addAgency() async {
    String? tin =  AppServices.instance.currentCompany.value!.tin;

    AddPosDto params = AddPosDto(
        name: nameAgencyController!.text.trim(),
        tin: tin!,
        address: AddressDto(localityCode: codeLocalities!,
            description: descAgencyController!.text.trim(),
            gps: GpsDto(latitude: double.parse(latitudeController!.text.trim()),
                longitude: double.parse(longitudeController!.text.trim()))),
      contact: ContactDto(phoneNumber: phoneController!.text.trim(),
          email: emailController!.text.trim()),
    );

    await companyCtr.addPosForCompany(context, params).then((val) async {
      if(val != null){
        Get.back(result: true);
      }
    });

  }

  Widget _buildBtnAddAgency(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ActionBtn(
          title: 'Créer une agence',
          loading: companyCtr.isLoading,
          onPressed: (){
            if (validate()) {
              _addAgency();
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
      appBar: appBarOther(context, "Ajouter une Agence"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Obx(() => IgnorePointer(
          ignoring: companyCtr.ignorePointer.isTrue,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _buildTitleBlocInfo("Identification"),
                _buildFormFieldIdentification(),
                const SizedBox(height: 30),
                _buildTitleBlocInfo("Adresse", isAction: true),
                _buildFormFieldAddress(),
                const SizedBox(height: 30),
                _buildTitleBlocInfo("Contact"),
                _buildFormFieldContact(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: _buildBtnAddAgency(),
    );
  }


}

