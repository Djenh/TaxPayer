import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/button/kcirclebutton.dart';
import 'package:invoice_app/commons/ui/kemptydata.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/constants/strings.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/app_storage.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/controllers/dashboard_ctrl.dart';
import 'package:invoice_app/presentation/features/agency/screens/agency_page.dart';
import 'package:invoice_app/presentation/features/company/widgets/card_company_page.dart';
import 'package:invoice_app/presentation/features/company/widgets/draggabledcrollabledheet_list.dart';
import 'package:invoice_app/presentation/features/repports/screens/repports_contente.dart';
import 'package:invoice_app/presentation/features/repports/screens/repports_revenue.dart';
import 'package:invoice_app/presentation/features/dashoard/widgets/tab_bar_widget.dart';
import 'package:invoice_app/presentation/features/pos/screens/pos_form_page.dart';
import 'package:invoice_app/presentation/features/registration/_strings/register_str.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/scan_verify_page.dart';
import 'package:invoice_app/presentation/features/statistics/screens/statistic_screen.dart';
import 'package:invoice_app/presentation/res/assets/app_assets.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../../../../utils/custom_image_view.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ScrollController _scrollController = ScrollController();
  RxBool isBottomNavVisible = true.obs;
  final dashboardCtr = locator<DashboardCtrl>();
  final companyCtr = locator<CompanyCtrl>();
  List<PosDataResponse> dataAgency = [];
  PosDataResponse? agenceSelcted;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDataAgency();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (isBottomNavVisible.value) {
          isBottomNavVisible(false);
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!isBottomNavVisible.value) {
          isBottomNavVisible(true);
        }
      }
    });
  }

  Future<void> _fetchDataAgency() async {
    await companyCtr.dataListPosCompanyByTin().then((val){
      dataAgency = val ?? [];
      setState(() {});
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(left: padding,right: padding),
      child: RefreshIndicator(
        onRefresh: () => Future.sync(() => _refreshData()),
        child: ListView(
          //controller: _scrollController,
          children: [
            CustomImageView(
              onTap: (){

              },
              height: 5,
              width: 209,
              imagePath: $appAssets.svgs.svframe,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: padding15,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        return KCircleButton(
                          color: KStyles.cardGrey,
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          child: CustomImageView(
                            height: 24,
                            width: 24,
                            imagePath: $appAssets.svgs.menu,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: padding,
                    ),
                    /*
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Bonjour"),
                        Text(
                          AppServices.instance.currentCompany.value?.name??"",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                     */
                  ],
                ),
                CustomImageView(
                  onTap: (){

                  },
                  height: 32,
                  width: 94,
                  imagePath: $appAssets.imgs.imgLogoHeader,
                  fit: BoxFit.contain,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /*
                    Container(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: KStyles.dropDownBorderColor)
                        ),
                        child: companyCtr.isLoading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            :
                        DropdownButtonHideUnderline(
                          child: DropdownButton<PosDataResponse>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                              color: Colors.grey.shade600,
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            items: dataAgency.map<DropdownMenuItem<PosDataResponse>>((PosDataResponse value) {
                              return DropdownMenuItem(
                                value: value,
                                child:  Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(value.name??"",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            isExpanded: true,
                            isDense: true,
                            hint: Text("Agences".tr,
                              style:
                              const TextStyle( fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,),
                            ),
                            onChanged: (PosDataResponse? value) {
                              agenceSelcted = value;
                              setState(() {});
                              saveDataCurrentPosToLocal(value!);
                            },
                            value: agenceSelcted,
                          ),
                        )
                    ),
                     */
                    KCircleButton(
                      color: KStyles.cardGrey,
                      onPressed: () {

                      },
                      child: const Icon(Iconsax.message_text,color: KStyles.blackColor),
                    ),
                    const SizedBox(
                      width: padding,
                    ),
                    KCircleButton(
                      color: KStyles.cardGrey,
                      onPressed: () {

                      },
                      child: const Icon(Iconsax.command_square,color: KStyles.blackColor),
                    ),
                    const SizedBox(
                      width: padding,
                    ),
                    KCircleButton(
                      color: KStyles.cardGrey,
                      onPressed: () => Get.to(() => const ScanVerifyPage()),
                      //onPressed: () => Get.to(() => const ManualCheckPage()),
                      child: const Icon(Iconsax.scan,color: KStyles.blackColor),
                    ),
                    /*
                    KCircleButton(
                      onPressed: () {
                        Get.to(() => AgencyPage());
                      },
                      child: const Icon(Iconsax.add, color: Colors.white),
                    ),
                     */
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: padding20,
            ),
            CompanyCard(
              showAction: true,
              child: const Padding(
                padding: EdgeInsets.only(top:  30),
                child: Text(
                  "Voir détail",
                  style: TextStyle(
                    fontSize: 12,
                    color: KStyles.primaryColor,
                  ),
                ),
              ),
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => DraggableScrollableSheet(
                    initialChildSize: 0.7,
                    minChildSize: 0.4,
                    maxChildSize: 0.9,
                    expand: false,
                    builder: (context, scrollController) {
                      return CompanyDetails(scrollController);
                    },
                  ),
                );
              },
            ),
            /*
                Column(
                  children: [
                    const SizedBox(
                      height: padding,
                    ),
                    const BusinessCard(
                      chiffreAffaire: "0 Fcfa",
                      invoiceAmount: "0 Fcfa",
                      totalAgency: "0",
                    ),
                    const SizedBox(
                      height: padding,
                    ),
                    Kemptydata(
                      textButton: RegisterStr.createAgency,
                      text: RegisterStr.emptyAgency,
                      onPressed: () async{
                        await Get.to(() => const PosFormPage())!.then((val){
                          if(val == true){
                            //_refreshData();
                          }
                        });
                      },
                    ),
                  ],
                ),
                 */
            const SizedBox(
              height: padding,
            ),
            Padding(
              padding: const EdgeInsets.all(padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildTabBarWidget(
                      opTap: () => dashboardCtr.onTabTapped(0),
                      title: RegisterStr.statistiques,
                      isSelected: dashboardCtr.currentIndex.value == 0 ? true : false,
                      selectedValue: 0
                  ),
                  buildTabBarWidget(
                      opTap: () => dashboardCtr.onTabTapped(1),
                      title: RegisterStr.agences,
                      isSelected: dashboardCtr.currentIndex.value == 1 ? true : false,
                      selectedValue: 1
                  ),
                  buildTabBarWidget(
                      opTap: () => dashboardCtr.onTabTapped(2),
                      title: RegisterStr.rapports,
                      isSelected: dashboardCtr.currentIndex.value == 2 ? true : false,
                      selectedValue: 2
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: padding20,
            ),
            if(dashboardCtr.currentIndex.value == 0)
              const StatisticScreen(),
            if(dashboardCtr.currentIndex.value == 1)
              Column(
                children: [
                  companyCtr.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : (dataAgency.isEmpty)
                      ?
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Kemptydata(
                      textButton: RegisterStr.createAgency,
                      text: RegisterStr.emptyAgency,
                      onPressed: () async{
                        await Get.to(() => const PosFormPage())!.then((val){
                          if(val == true){
                            //_refreshData();
                          }
                        });
                      },
                    ),
                  )
                      : AgencyPage(dataAgency: dataAgency),
                ],
              ),

            if(dashboardCtr.currentIndex.value == 2)
              RepportsContente(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    ));

    /*
    floatingActionButton: FloatingActionButton.extended(
          backgroundColor: KStyles.primaryColor,
          elevation: 1,
          onPressed: (){

          },
          label: const Text(RegisterStr.createInvoice,style: TextStyle(color: Colors.white)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          icon: const Icon(Iconsax.add, color: Colors.white, size: 25),
        )
     */
  }

  Future<void> saveDataCurrentPosToLocal(PosDataResponse data) async {
    await AppStorage.instance.setInstance(key: dataPos, value: data);
    await AppServices.instance.checkCurrentPosData();
    Future.microtask((){
      _refreshData();
    });
  }


}
