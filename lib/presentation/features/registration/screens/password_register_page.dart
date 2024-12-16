import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/controllers/auth_ctrl.dart';

import '../../../../commons/layout/k_default_layout.dart';
import '../../../../domain/value_objects/password_vo.dart';
import '../../../_widgets/action_btn.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/assets/app_assets.dart';
import '../../../res/input_formaters.dart';
import '../../../res/style/e_style.dart';
import '../../home/screens/home_page.dart';
import '../_strings/register_str.dart';
import '../_widgets/footer_container.dart';
import '../_widgets/header_container.dart';



class PasswordRegisterPage extends StatefulWidget {
  const PasswordRegisterPage({super.key});

  @override
  State<PasswordRegisterPage> createState() => _PasswordRegisterPageState();
}

class _PasswordRegisterPageState extends State<PasswordRegisterPage> {

  final authCtr = locator<AuthCtrl>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  Rx<String?> passwordError = Rx<String?>(null);
  Rx<String?> confirmPasswordError = Rx<String?>(null);
  RxBool isObscure1 = true.obs;
  RxBool isObscure2 = true.obs;



  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
  }


  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && PasswordVo.isValid(passwordController!.text.trim())
        && confirmPasswordController!.text.trim() == passwordController!.text.trim()) {
      //TODO : implement action
      return true;
    } else {
      return false;
    }
  }


  void getErrors() {
    passwordError.value = PasswordVo.validate(passwordController!.text.trim());
    confirmPasswordError.value = PasswordVo.match(
        confirmPasswordController!.text.trim(),
        passwordController!.text.trim());
  }


  Widget buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      child: ActionBtn(
        title: "Continuer",
        icon: Iconsax.check,
        onPressed: () {
          Get.to(() => HomePage());
        },
        loading: authCtr.isLoading,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: authCtr.onPopInvoked,
      child: Scaffold(
        /*appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),*/
        extendBodyBehindAppBar: true,
        body: Obx(() => IgnorePointer(
          ignoring: authCtr.ignorePointer.isTrue,
          child: KDefaultLayout(
            isReversed: false,
            title: RegisterStr.titleLayoutV,
            subtitle: RegisterStr.subTitleLayoutV,
            imagePath: $appAssets.imgs.img3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const HeaderContainer(
                    title: RegisterStr.headerTitleR,
                    subTitle: "Définissez un mot de passe pour votre compte contribuable."
                ),
                const SizedBox(height: 30),
                const Text("Mot de passe"),
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,
                  obscureText: isObscure1.value,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: noSpaceNoEmoji,
                  onChanged: (String v) => passwordError.value = null,
                  decoration: AppInputStyles.authInputDecoration(
                    hintText: "",
                    show: isObscure1,
                    errorText: passwordError.value,
                  ),
                ),
                const SizedBox(height: padding * 2),
                const Text("Confirmez mot de passe"),
                const SizedBox(height: 6),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: isObscure2.value,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: noSpaceNoEmoji,
                  onChanged: (String v) =>
                  confirmPasswordError.value = null,
                  decoration: AppInputStyles.authInputDecoration(
                    hintText: "",
                    show: isObscure2,
                    errorText: confirmPasswordError.value,
                  ),
                ),
                const SizedBox(height: padding * 2),
                buildVerifyButton(),
                const SizedBox(height: 60),
                const FooterContainer(),
              ],
            ),
          ),
        )),
      ),
    );
  }


}
