import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/controllers/auth_ctrl.dart';
import 'package:invoice_app/presentation/features/registration/screens/verifying_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../commons/layout/k_default_layout.dart';
import '../../../../domain/value_objects/email_vo.dart';
import '../../../../domain/value_objects/phone_vo.dart';
import '../../../_widgets/action_btn.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/assets/app_assets.dart';
import '../../../res/input_formaters.dart';
import '../_strings/register_str.dart';
import '../_widgets/footer_container.dart';
import '../_widgets/header_container.dart';

class ChoosingMethodPage extends StatefulWidget {
  const ChoosingMethodPage({super.key});

  @override
  State<ChoosingMethodPage> createState() => _ChoosingMethodPageState();
}

class _ChoosingMethodPageState extends State<ChoosingMethodPage> {

  final authCtr = locator<AuthCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? emailController;
  TextEditingController? phoneController;
  bool optionPhone = true;
  Rx<String?> phoneError = Rx<String?>(null);
  Rx<String?> emailError = Rx<String?>(null);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController?.dispose();
    phoneController?.dispose();
  }

  Widget spaceI(){
    return const SizedBox(height: padding / 2 + 5);
  }

  void getErrors() {
    if (optionPhone) {
      phoneError.value = PhoneVo.validate(phoneController!.text.trim());
    } else {
      emailError.value = EmailVo.validate(emailController!.text.trim());
    }
  }

  bool validate() {
    final form = formKey.currentState;
    getErrors();

    if(form!.validate() && optionPhone
        ? PhoneVo.isValid(phoneController!.text.trim())
        : EmailVo.isValid(emailController!.text.trim())){
      return true;
    }else{
      return false;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),*/
      extendBodyBehindAppBar: true,
      body:  KDefaultLayout(
        title: RegisterStr.titleLayoutI,
        subtitle: RegisterStr.subTitleLayoutI,
        imagePath: $appAssets.imgs.img3,
        isReversed: false,
        child: Obx(() => Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const HeaderContainer(
                title: RegisterStr.headerTitleR,
                subTitle: RegisterStr.headerSubTitleC,
              ),
              const SizedBox(height: 10),
              const Text(RegisterStr.chooseMethod),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Radio<bool?>(
                            value: true,
                            groupValue: optionPhone,
                            onChanged: (bool? value){
                              setState(() {
                                optionPhone = value!;
                                emailController?.clear();
                                emailError.value = null;
                              });
                            }
                        ),
                        const Text(RegisterStr.toPhone,
                            style: TextStyle(fontSize: 12, color: Colors.black))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio<bool?>(
                            value: false,
                            groupValue: optionPhone,
                            onChanged: (bool? value){
                              setState(() {
                                optionPhone = value!;
                                phoneController?.clear();
                              });
                            }
                        ),
                        const Text(RegisterStr.toMail,
                            style: TextStyle(fontSize: 12, color: Colors.black))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: optionPhone
                    ? phoneController
                    : emailController,
                textInputAction: TextInputAction.done,
                keyboardType: optionPhone
                    ? TextInputType.phone
                    : TextInputType.emailAddress,
                inputFormatters: noSpaceNoEmoji,
                onChanged: (String v) => optionPhone
                    ? phoneError.value = null
                    : emailError.value = null,
                decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "",
                  errorText: optionPhone ? phoneError.value : emailError.value,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ActionBtn(
                  title: "Continuer",
                  icon: Iconsax.check,
                  onPressed: (){
                    if (validate()) {
                       Get.to(() => const VerifyingPage());
                    }
                    //Get.to(() => const VerifyingPage());
                  },
                  loading: authCtr.isLoading,
                ),
              ),
              const SizedBox(height: 60),
              const FooterContainer()
            ],
          ),
        )),
      ),
    );
  }


}
