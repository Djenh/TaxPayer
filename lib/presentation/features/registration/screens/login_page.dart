import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/environment_config.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/login_dto.dart';
import 'package:invoice_app/domain/value_objects/field_vo.dart';
import 'package:invoice_app/presentation/features/registration/screens/registration_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../commons/layout/k_default_layout.dart';
import '../../../../core/configs/injection_container.dart';
import '../../../../domain/value_objects/password_vo.dart';
import '../../../_widgets/action_btn.dart';
import '../../../_widgets/custom_btn.dart';
import '../../../controllers/auth_ctrl.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/assets/app_assets.dart';
import '../../../res/input_formaters.dart';
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
  TextEditingController? userNameController;
  TextEditingController? passwordController;
  Rx<String?> userNameError = Rx<String?>(null);
  Rx<String?> emailError = Rx<String?>(null);
  Rx<String?> passwordError = Rx<String?>(null);
  RxBool isObscure = true.obs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }


  void getErrors() {
    //passwordError.value = PasswordVo.validate(passwordController!.text.trim());
    userNameError.value = FieldVo.validate(userNameController!.text.trim());
    //emailError.value = EmailVo.validate(emailController!.text.trim());
  }


  bool validate() {
    final FormState? form = formKey.currentState;
    getErrors();
    if (form!.validate() && PasswordVo.isValid(passwordController!.text.trim())) {
      //TODO : implement action
      return true;
    } else {
      return false;
    }
  }


  void login() async {
    if(userNameController!.text.isNotEmpty &&
        passwordController!.text.isNotEmpty){
      LoginDto params = LoginDto(
          clientId: locator<EnvironmentConfig>().clientId,
          username: userNameController!.text.trim(),
          password: passwordController!.text.trim()
      );
      debugPrint("dto login => ${params.toJson()}");

      await authCtr.loginUser(context, params);
    }else{
      ToastService.showWarning(context, "Connexion", description:
      "Veuillez renseinger votre nom d'utilisateur et mot de passe");
    }
  }


  Widget buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ActionBtn(
        title: "Connexion",
        icon: Iconsax.check,
        onPressed: () {
          final user = AppServices.instance.currentCompany.value;
          if(user != null){
            login();
          } else {
            ToastService.showWarning(context, 'Vérification',
                description: "Veuillez allez verifier votre tin.");
          }
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
        child: Obx(() => Form(
          key: formKey,
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
              const Text("Nom d'utilisateur"),
              const SizedBox(height: 4),
              TextFormField(
                controller: userNameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                inputFormatters: noSpaceNoEmoji,
                onChanged: (String v) => userNameError.value = null,
                decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "",
                  errorText: userNameError.value,
                ),
              ),
              /*const Text(RegisterStr.email),
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
              ),*/
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
        )),
      ),
    );
  }


}
