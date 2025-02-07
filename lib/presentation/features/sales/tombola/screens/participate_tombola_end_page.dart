import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/sales/tombola/screens/tombola_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/action_btn.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../controllers/lottery_ctrl.dart';



class ParticipateTombolaEndPage extends StatefulWidget {
  const ParticipateTombolaEndPage({super.key});

  @override
  State<ParticipateTombolaEndPage> createState() => _ParticipateTombolaEndPageState();
}

class _ParticipateTombolaEndPageState extends State<ParticipateTombolaEndPage> {

  final lotteryCtrl = locator<LotteryCtrl>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Participer au tombola", actionList: [] ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding20),
        margin: const EdgeInsets.only(top: padding20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildText(context, "Félicitations",
                18, Colors.black, fontWeight: FontWeight.w700),
            const SizedBox(height: padding,),
            buildText(context, "Votre participation au tirage mensuel a été effectué avec succès.",
                15, Colors.black, fontWeight: FontWeight.w400, maxLine:4, textAlign: TextAlign.center),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                    child: ActionBtn(
                      title: 'Quitter',
                      loading: lotteryCtrl.isLoading,
                      onPressed: ()=> Get.to(() => const TombolaPage()),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
