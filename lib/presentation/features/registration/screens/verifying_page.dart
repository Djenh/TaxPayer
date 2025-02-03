import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/presentation/controllers/auth_ctrl.dart';
import 'package:invoice_app/presentation/features/registration/_strings/register_str.dart';
import 'package:invoice_app/presentation/features/registration/_widgets/footer_container.dart';
import 'package:invoice_app/presentation/features/registration/_widgets/header_container.dart';
import 'package:invoice_app/presentation/features/registration/screens/password_register_page.dart';
import 'package:invoice_app/presentation/res/assets/app_assets.dart';

import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/configs/injection_container.dart';
import '../../../_widgets/action_btn.dart';




class VerifyingPage extends StatefulWidget {
  const VerifyingPage({super.key});

  @override
  State<VerifyingPage> createState() => _VerifyingPageState();
}

class _VerifyingPageState extends State<VerifyingPage> {

  final authCtr = locator<AuthCtrl>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String currentText = "";


  @override
  void initState() {
    super.initState();
    authCtr.makeTimer();
  }


  TextStyle getTextStyle({FontWeight fontWeight = FontWeight.normal}) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: fontWeight);
  }


  Widget buildPinputField() {
    return Pinput(
      length: 4,
      onChanged: (value) {
        if (value.trim().length == 4 && value.trim().isNumericOnly) {
          FocusScope.of(context).unfocus();
          currentText = value;
        } else {
          currentText = "";
        }
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.phone,
    );
  }


  Widget buildResendCodeSection() {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Pas reçu de code ?"),
          if (authCtr.timing.value != 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                authCtr.formatMinuteSecond(Duration(seconds: authCtr.timing.value)),
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
          if (authCtr.timing.value == 0)
            TextButton(
              onPressed: (){},
              child: const Text("Renvoyer"),
            ),
        ],
      ),
    );
  }


  Widget buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      child: ActionBtn(
        title: "Continuer",
        icon: Iconsax.check,
        onPressed: () {
          if (currentText.length == 4) {
            Get.to(() => const PasswordRegisterPage());
          } else {
            // TODO: Implementer la gestion des erreurs (exemple : Snackbar)
          }
        },
        loading: authCtr.isLoading,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldState,
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),*/
      extendBodyBehindAppBar: true,
      body: KDefaultLayout(
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
                subTitle: "Nous avons envoyé un code OTP au numéro 665644323."
                    " Entrez le code pour continuer."
            ),
            const SizedBox(height: padding * 2),
            buildPinputField(),
            const SizedBox(height: padding),
            buildResendCodeSection(),
            const SizedBox(height: padding * 2),
            buildVerifyButton(),
            const SizedBox(height: 60),
            const FooterContainer(),
          ],
        ),
      ),
    );
  }

}

