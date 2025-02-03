import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/registration/screens/verify_otp_pwd_page.dart';

import '../../../../commons/layout/k_default_layout.dart';
import '../../../../core/configs/injection_container.dart';
import '../../../../domain/value_objects/email_vo.dart';
import '../../../_widgets/action_btn.dart';
import '../../../controllers/auth_ctrl.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/assets/app_assets.dart';
import '../../../res/input_formaters.dart';
import '../_strings/register_str.dart';
import '../_widgets/header_container_row.dart';

class InitRestPwdPage extends StatefulWidget {
  const InitRestPwdPage({super.key});

  @override
  State<InitRestPwdPage> createState() => _InitRestPwdPageState();
}

class _InitRestPwdPageState extends State<InitRestPwdPage> {

  final authCtr = locator<AuthCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? emailController;
  Rx<String?> emailError = Rx<String?>(null);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController?.dispose();
  }


  void getErrors() {
    emailError.value = EmailVo.validate(emailController!.text.trim());
  }

  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && EmailVo.isValid(emailController!.text.trim())) {
      //TODO : implement action
      return true;
    } else {
      return false;
    }
  }


  Widget buildValidateButton() {
    return SizedBox(
      width: double.infinity,
      child: ActionBtn(
        title: "Valider",
        icon: Iconsax.check,
        onPressed: () {
          Get.to(() => const VerifyOtpPwdPage());
        },
        loading: authCtr.isLoading,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: KDefaultLayout(
        isReversed: true,
        title: RegisterStr.titleLayout,
        subtitle: RegisterStr.subTitleLayout,
        imagePath: $appAssets.imgs.img3,
        child: Obx(() => IgnorePointer(
          ignoring: authCtr.ignorePointer.isTrue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                RegisterStr.titleInitPwd,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 40),
              const HeaderContainerRow(
                icon: Iconsax.password_check,
                title: RegisterStr.titleInitR,
                subTitle: RegisterStr.subTitleInitR,
              ),
              const SizedBox(height: 30),
              const Text("Tin/Email"),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                inputFormatters: noSpaceNoEmoji,
                onChanged: (String v) => emailError.value = null,
                decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "",
                  errorText: emailError.value,
                ),
              ),
              const SizedBox(height: 30),
              buildValidateButton(),
            ],
          ),
        )),
      ),
    );
  }


}
