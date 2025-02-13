// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/constants/strings.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/app_storage.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/invoice_create_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class PosDialogScreen extends StatefulWidget {
  final bool goBack;
  const PosDialogScreen({super.key,required this.goBack});

  @override
  _PosDialogScreenState createState() => _PosDialogScreenState();
}

class _PosDialogScreenState extends State<PosDialogScreen> {
  double padding = 16.0;
  double avatarRadius = 66.0;

  final companyCtr = locator<CompanyCtrl>();
  List<PosDataResponse> dataAgency = [];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDataAgency();
    });
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
  @override
  Widget build(BuildContext context) {
    final currentPos = AppServices.instance.currentPos.value;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Sélectionnez un point de vente."),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _refreshData()),
        child: SingleChildScrollView(
          child: Obx(() => companyCtr.isLoading.isTrue
              ? const SizedBox(height: 150,child: Center(child: CircularProgressIndicator()))
              : (dataAgency.isEmpty)
              ? Center(
              child: SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.building_3, color: KStyles.primaryColor),
                      const SizedBox(height: 6),
                      buildText(context, "Aucun points de vente enregistré.", 16, Colors.black),

                    ],
                  ),
                ),
              )
          )
              :
          ListView.builder(
            itemCount: dataAgency.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int ps){
              return ListTile(
                onTap: () => saveDataCurrentPosToLocal(dataAgency[ps]),
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
      ),
    );
  }

  Future<void> saveDataCurrentPosToLocal(PosDataResponse data) async {
    await AppStorage.instance.setInstance(key: dataPos, value: data);
    await AppServices.instance.checkCurrentPosData();
    Navigator.pop(context);
    if(!widget.goBack){
      Get.to(() => const InvoiceCreatePage());
    }

    /*
    Future.microtask((){
      _refreshData();
    });
     */
  }
}



