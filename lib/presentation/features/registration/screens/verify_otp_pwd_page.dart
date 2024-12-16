import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/registration/screens/password_rest_page.dart';
import 'package:pinput/pinput.dart';

import '../../../../commons/layout/k_default_layout.dart';
import '../../../../core/configs/injection_container.dart';
import '../../../_widgets/action_btn.dart';
import '../../../controllers/auth_ctrl.dart';
import '../../../res/assets/app_assets.dart';
import '../../../res/style/e_style.dart';
import '../_strings/register_str.dart';
import '../_widgets/header_container_row.dart';

class VerifyOtpPwdPage extends StatefulWidget {
  const VerifyOtpPwdPage({super.key});

  @override
  State<VerifyOtpPwdPage> createState() => _VerifyOtpPwdPageState();
}

class _VerifyOtpPwdPageState extends State<VerifyOtpPwdPage> {

  final authCtr = locator<AuthCtrl>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String currentText = "";


  @override
  void initState() {
    super.initState();
    authCtr.makeTimer();
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
        title: "Valider",
        icon: Iconsax.check,
        onPressed: () {
          if (currentText.length == 4) {
            Get.to(() => const PasswordRestPage());
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
                icon: Iconsax.barcode,
                title: RegisterStr.titleInitCR,
                subTitle: RegisterStr.subTitleInitCR,
              ),
              const SizedBox(height: 30),
              buildPinputField(),
              const SizedBox(height: padding),
              buildResendCodeSection(),
              const SizedBox(height: padding * 2),
              buildVerifyButton(),
            ],
          ),
        )),
      ),
    );
  }



}
