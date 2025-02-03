import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/core/constants/strings.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/app_storage.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/features/registration/_strings/register_str.dart';
import 'package:invoice_app/presentation/features/registration/screens/login_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../core/configs/injection_container.dart';
import '../../../_widgets/action_btn.dart';
import '../../../_widgets/enum_title.dart';
import '../../../res/assets/app_assets.dart';
import '../../home/screens/home_page.dart';
import '../_widgets/footer_container.dart';
import '../_widgets/header_container.dart';


class IdentityPage extends StatefulWidget {
  const IdentityPage({super.key, required this.dataCompany});

  final CompanyTinResponse dataCompany;

  @override
  State<IdentityPage> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {

  final companyCtr = locator<CompanyCtrl>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget spaceI(){
    return const SizedBox(height: padding / 2 + 5);
  }


  Widget dataContainer(){
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: KStyles.greenOp,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EnumTitle(
                title: RegisterStr.typeI,
                value: widget.dataCompany.legalForm?.name ?? "---",
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(width: 10),
              EnumTitle(
                title: RegisterStr.city,
                value: widget.dataCompany.address?.locality?.name ?? "---",
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.rs,
                value: widget.dataCompany.name ?? "---",
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.ifu,
                value: widget.dataCompany.tin ?? "---",
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          /*const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: "RCCM",
                value: "096766GUi002024",
                style1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),*/
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.phone,
                //value: companyCtr.hashPhone("${widget.dataCompany.contact!.phoneNumber}"),
                value: "${widget.dataCompany.contact!.phoneNumber}",
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.email,
                //value: companyCtr.hashEmail("${widget.dataCompany.contact!.email}"),
                value: "${widget.dataCompany.contact!.email}",
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.webSite,
                value: widget.dataCompany.contact!.websiteUrl ?? "---",
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Future<void> saveDataCompanyToLocal() async {
    await AppStorage.instance.setInstance(key: dataCompany, value: widget.dataCompany);
    await AppServices.instance.checkCompanyData();
    Get.offAll(() => const LoginPage());
    //Get.to(() => HomePage());
    //Get.to(() => const ChoosingMethodPage());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const HeaderContainer(
              title: RegisterStr.headerTitleR,
              subTitle: RegisterStr.headerSubTitleR,
            ),
            const SizedBox(height: 20),
            dataContainer(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ActionBtn(
                title: "Continuer",
                icon: Iconsax.check,
                onPressed: (){
                  saveDataCompanyToLocal();
                },
                loading: companyCtr.isLoading,
              ),
            ),
            const SizedBox(height: 60),
            const FooterContainer()
          ],
        ),
      ),
    );
  }

}

