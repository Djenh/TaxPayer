import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/app_storage.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/features/pos/screens/pos_form_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../core/constants/strings.dart';


class PosPage extends StatefulWidget {
  const PosPage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<PosPage> createState() => _PosPageState();
}

class _PosPageState extends State<PosPage> {

  final companyCtr = locator<CompanyCtrl>();
  TextEditingController? searchController;
  List<PosDataResponse> dataAgency = [];


  @override
  void initState() {
    super.initState();
    _fetchDataAgency();
  }

  Future<void> _fetchDataAgency() async {
    await companyCtr.dataListPosCompanyByTin().then((val){
      dataAgency = val ?? [];
    });
  }

  Future<void> _refreshData() async {
    if(dataAgency.isNotEmpty){
      dataAgency.clear();
    }
    _fetchDataAgency();
    setState(() {});
  }

  void actionPos() async {
    await Get.to(() => const PosFormPage())!.then((val){
      if(val == true){
        _refreshData();
      }
    });
  }

  Future<void> saveDataCurrentPosToLocal(PosDataResponse data) async {
    await AppStorage.instance.setInstance(key: dataPos, value: data);
    await AppServices.instance.checkCurrentPosData();
    Future.microtask((){
      _refreshData();
    });
  }



  @override
  Widget build(BuildContext context) {
    final currentPos = AppServices.instance.currentPos.value;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Mes points de vente",
          actionList: [
        if(!widget.isManage)
           IconButton(
            onPressed: () async {
              actionPos();
            },
            icon: const Icon(CupertinoIcons.add_circled_solid,
                color: KStyles.primaryColor, size: 32)
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _refreshData()),
        child: Obx(() => companyCtr.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : (dataAgency.isEmpty)
            ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Iconsax.building_3, color: KStyles.primaryColor),
                const SizedBox(height: 6),
                buildText(context, "Aucun points de vente enregistré.", 16, Colors.black)
              ],
            )
        )
            : ListView.builder(
          itemCount: dataAgency.length,
          itemBuilder: (BuildContext context, int ps){
            return ListTile(
              onTap: (){
                //Get.to(()=>const PosDetail());
              },
              onLongPress: (){
                saveDataCurrentPosToLocal(dataAgency[ps]);
              },
              leading: const CircleAvatar(child: Icon(Iconsax.building_3)),
              title: buildText(context, dataAgency[ps].name!, 16, Colors.black, fontWeight: FontWeight.w600),
              subtitle: buildText(context, dataAgency[ps].address?.description ?? "---", 12, Colors.black),
              trailing: (currentPos != null && currentPos.id == dataAgency[ps].id)
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
            );
          },
        )),
      ),
      floatingActionButton: (widget.isManage == true)
          ? FloatingActionButton(
        backgroundColor: KStyles.primaryColor,
        onPressed: () async {
          actionPos();
        },
        child: const Icon(Iconsax.location_add, color: Colors.white),
      )
          : null,
    );
  }
}


