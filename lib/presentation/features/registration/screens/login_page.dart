import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/registration/screens/registration_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../commons/layout/k_default_layout.dart';
import '../../../../core/configs/injection_container.dart';
import '../../../../domain/value_objects/email_vo.dart';
import '../../../../domain/value_objects/password_vo.dart';
import '../../../_widgets/action_btn.dart';
import '../../../_widgets/custom_btn.dart';
import '../../../controllers/auth_ctrl.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/assets/app_assets.dart';
import '../../../res/input_formaters.dart';
import '../../home/screens/home_page.dart';
import '../_strings/register_str.dart';
import '../_widgets/header_container.dart';
import 'init_rest_pwd_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final authCtr = locator<AuthCtrl>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? emailController;
  TextEditingController? passwordController;
  Rx<String?> emailError = Rx<String?>(null);
  Rx<String?> passwordError = Rx<String?>(null);
  RxBool isObscure = true.obs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }


  void getErrors() {
    passwordError.value = PasswordVo.validate(passwordController!.text.trim());
    emailError.value = EmailVo.validate(emailController!.text.trim());
  }


  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && PasswordVo.isValid(passwordController!.text.trim())
        && EmailVo.isValid(emailController!.text.trim())) {
      //TODO : implement action
      return true;
    } else {
      return false;
    }
  }


  Widget buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ActionBtn(
        title: "Connexion",
        icon: Iconsax.check,
        onPressed: () {
          Get.to(() => HomePage());
        },
        loading: authCtr.isLoading,
      ),
    );
  }

  Widget buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomBtn(
        title: "Inscription",
        onPressed: () {
          Get.to(() => const RegistrationPage());
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KDefaultLayout(
        isReversed: true,
        title: RegisterStr.titleLayout,
        subtitle: RegisterStr.subTitleLayout,
        imagePath: $appAssets.imgs.img3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderContainer(
              title: RegisterStr.titleLogin,
              subTitle: RegisterStr.subTitleLogin,
            ),
            const SizedBox(height: 20),
            Text(
              "Connexion",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            const SizedBox(height: 20),
            const Text(RegisterStr.email),
            const SizedBox(height: 4),
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
            const Text(RegisterStr.pwd),
            const SizedBox(height: 4),
            TextField(
              controller: passwordController,
              obscureText: isObscure.value,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              inputFormatters: noSpaceNoEmoji,
              onChanged: (String v) => passwordError.value = null,
              decoration: AppInputStyles.authInputDecoration(
                hintText: "",
                show: isObscure,
                errorText: passwordError.value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Get.to(()=> const InitRestPwdPage()),
                    child: Text(
                      RegisterStr.pwdForget,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12, color: KStyles.primaryColor,
                          fontWeight: FontWeight.bold, decoration:
                            TextDecoration.underline, decorationColor:
                               KStyles.primaryColor
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 20),
            buildLoginButton(),
            const SizedBox(height: 10),
            buildRegisterButton()
          ],
        ),
      ),
    );
  }


}
