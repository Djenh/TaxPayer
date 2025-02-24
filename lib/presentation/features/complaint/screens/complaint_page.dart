import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/complaint/screens/complaint_detail_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../domain/entities/complaint/complaint_data_response.dart';
import '../../../_widgets/app_bar_custom.dart';
import '../../../controllers/complaint_ctrl.dart';
import 'complaint_search_page.dart';


class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {

  final complaintCtrl = locator<ComplaintCtrl>();
  List<ComplaintDataResponse> dataList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDataPlainte();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<void> _getDataPlainte() async {
    await complaintCtrl.dataListPlainte().then((val){
      setState(() {
        dataList = val?? [];
      });
    });
  }

  Future<void> _refreshData() async {
    if(dataList.isNotEmpty){
      dataList.clear();
    }
    _getDataPlainte();
    setState(() {});
  }



  Widget buildPlainteCard(ComplaintDataResponse plainte)
  {
    return InkWell(
      onTap: () => Get.to(() => ComplaintDetailPage(complaint: plainte)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: KStyles.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: buildText(
                      context, plainte.category?.name??"", 11, KStyles.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Flexible(
                flex: 1,
                child: buildText(context, plainte.status??"", 12,
                    KStyles.blackColor, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: padding),
          buildText(context, plainte.subject??"", 12, maxLine: 3,
              KStyles.blackColor, fontWeight: FontWeight.w500),
          const SizedBox(height: padding),
          buildText(context, "@${plainte.concernName??""}", 12,
              KStyles.blackColor, fontWeight: FontWeight.w500),
          const SizedBox(height: padding5),
          const Divider(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHome(context, "Plaintes",
        actionList: [
          IconButton(
              onPressed: () {
                Get.to(() => const ComplaintSearchPage());
              }, icon: const Icon(Iconsax.search_normal)),
          IconButton(
              // onPressed: () => Get.to(() => const ComplaintCreatePage()),
              onPressed: () {},
              icon: const Icon(CupertinoIcons.add_circled_solid,
                  color: KStyles.primaryColor, size: 32)
          ),
        ],
          bgColor: Colors.white
      ),
      body: RefreshIndicator(
        onRefresh: ()=> Future.sync(() => _refreshData()),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: padding15, vertical: padding15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(context, "Liste des plaintes", 16, Colors.black, fontWeight: FontWeight.w700),
                const SizedBox(height: padding20,),
                (dataList.isEmpty)
                    ? const Center(child: Text("Aucune plainte enregistrée !"))
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int idx){
                    return buildPlainteCard(dataList[idx]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
