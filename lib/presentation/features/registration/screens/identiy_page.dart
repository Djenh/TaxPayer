import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/presentation/controllers/auth_ctrl.dart';
import 'package:invoice_app/presentation/features/registration/_strings/register_str.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../core/configs/injection_container.dart';
import '../../../_widgets/action_btn.dart';
import '../../../_widgets/enum_title.dart';
import '../../../res/assets/app_assets.dart';
import '../_widgets/footer_container.dart';
import '../_widgets/header_container.dart';
import 'choosing_method_page.dart';



class IdentityPage extends StatefulWidget {
  const IdentityPage({super.key});

  @override
  State<IdentityPage> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {

  final authCtr = locator<AuthCtrl>();


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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EnumTitle(
                title: RegisterStr.typeI,
                value: "Societé",
                style1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(width: 10),
              EnumTitle(
                title: "Ville",
                value: "Libreville",
                style1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.rs,
                value: "OMEGA NUMERIC IT",
                style1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.ifu,
                value: "1234567890123",
                style1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
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
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EnumTitle(
                title: RegisterStr.phone,
                value: authCtr.hashPhone("66085678"),
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
                value: authCtr.hashEmail("contact@omeganumeric.tech"),
                style1: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                style2: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
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
                  // TODO: implement control to navigate next page
                  Get.to(() => const ChoosingMethodPage());
                },
                loading: authCtr.isLoading,
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

