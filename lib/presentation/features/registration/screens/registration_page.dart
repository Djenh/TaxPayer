import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';
import 'package:invoice_app/presentation/res/assets/app_assets.dart';
import '../../../_widgets/action_btn.dart';
import '../../../res/input_formaters.dart';
import '../_strings/register_str.dart';
import '../_widgets/footer_container.dart';
import '../_widgets/header_container.dart';
import 'identiy_page.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  //final authCtr = locator<AuthCtrl>();
  final companyCtr = locator<CompanyCtrl>();
  TextEditingController? ifuController;
  Rx<String?> ifuError = Rx<String?>(null);

  @override
  void initState() {
    super.initState();
    ifuController = TextEditingController();
    /*ifuController?.addListener(() {
      if (ifuController!.text.length > 13) {
        ifuController!.text = ifuController!.text.substring(0, 13);
        ifuController!.selection = TextSelection.fromPosition(
          TextPosition(offset: ifuController!.text.length),
        );
      }
    });*/
  }

  @override
  void dispose() {
    ifuController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: KDefaultLayout(
        isReversed: false,
        title: RegisterStr.titleLayout,
        subtitle: RegisterStr.subTitleLayout,
        imagePath: $appAssets.imgs.img3,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const HeaderContainer(
                  title: RegisterStr.headerTitleR,
                  subTitle: RegisterStr.headerSubTitleR,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: ifuController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  inputFormatters: noSpaceNoEmoji,
                  onChanged: (String v) => ifuError.value = null,
                  decoration: AppInputStyles.defaultInputDecoration(
                    labelText: "IFU",
                    errorText: ifuError.value,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ActionBtn(
                    title: "Vérifier",
                    icon: Iconsax.check,
                    onPressed: () async {
                      await companyCtr.dataCompanyByTin(context, ifuController!.text.trim()).then((val){
                        if(val != null){
                          Get.to(() => IdentityPage(dataCompany: val));
                        }
                      });
                    },
                    loading: companyCtr.isLoading,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
            const SizedBox(height: 60),
            const FooterContainer()
          ],
        ),
      ),
    );
  }
}
