import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/button/kcirclebutton.dart';
import 'package:invoice_app/commons/ui/kemptydata.dart';
import 'package:invoice_app/commons/ui/kstatisticcard.dart';
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
import 'package:invoice_app/presentation/features/repports/screens/repports_revenue.dart';
import 'package:invoice_app/presentation/features/statistics/screens/card_business_page.dart';
import 'package:invoice_app/presentation/features/dashoard/widgets/tab_bar_widget.dart';
import 'package:invoice_app/presentation/features/pos/screens/pos_form_page.dart';
import 'package:invoice_app/presentation/features/registration/_strings/register_str.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/scan_verify_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
  Widget build(BuildContext context) {
    return Obx(() =>Padding(
      padding: const EdgeInsets.all(10.0),
      child: RefreshIndicator(
        onRefresh: () => Future.sync(() => _refreshData()),
        child: ListView(
          children: [
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
                          child: const Icon(Iconsax.user,color: KStyles.blackColor),
                        );
                      },
                    ),
                    const SizedBox(
                      width: padding,
                    ),
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
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    const SizedBox(
                      width: padding15,
                    ),
                    KCircleButton(
                      color: KStyles.cardGrey,
                      onPressed: () => Get.to(() => const ScanVerifyPage()),
                      child: const Icon(Iconsax.scan,color: KStyles.blackColor),
                    ),
                    const SizedBox(
                      width: padding15,
                    ),
                    KCircleButton(
                      onPressed: () {
                        Get.to(() => AgencyPage());
                      },
                      child: const Icon(Iconsax.add, color: Colors.white),
                    ),
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
              Column(
                children: [
                  const BusinessCard(
                    chiffreAffaire: "1 Milliard Fcfa",
                    invoiceAmount: "1 Million Fcfa",
                    totalAgency: "05",
                  ),
                  const SizedBox(
                    height: padding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KStatisticard(
                              title: "32",
                              subTitle:  "Achats",
                            onPressed: (){

                            },
                            width: 100,
                            height: 80,
                          ),
                          KStatisticard(
                            title: "12",
                            subTitle:  "Taxe",
                            onPressed: (){

                            },
                            width: 100,
                            height: 80,
                          ),
                          KStatisticard(
                              width: 100,
                              height: 80,
                              title: "10",
                              subTitle:  "Clients",
                            onPressed: (){

                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: KStyles.dropDownBorderColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(padding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chiffres d’affaires",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: KStyles.blackColor),
                              ),
                              const SizedBox(height: 10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                  child: DataTable(
                                    headingRowColor: MaterialStateColor.resolveWith(
                                            (states) => KStyles.primaryColor),
                                    headingTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    columns: const [
                                      DataColumn(label: Text("MOIS",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))),
                                      DataColumn(label: Text("NBRE FACTURE",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))),
                                      DataColumn(label: Text("TOTAL",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))),
                                    ],
                                    rows: const [
                                      DataRow(cells: [
                                        DataCell(Text("Janvier")),
                                        DataCell(Text("100")),
                                        DataCell(Text("120K")),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text("Février")),
                                        DataCell(Text("120")),
                                        DataCell(Text("62M")),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text("Mars")),
                                        DataCell(Text("60")),
                                        DataCell(Text("12K")),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Situation",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: KStyles.blackColor),
                              ),
                              const SizedBox(
                                height: padding5,
                              ),
                              Text(
                                "Période : ${dashboardCtr.selectedStartDate.toString().split(' ')[0]} au ${dashboardCtr.selectedEndDate.toString().split(' ')[0]}",
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                      ),
                      GestureDetector(
                        onTap: (){
                          dashboardCtr.pickDateRange(context,false);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: KStyles.dropDownBorderColor)
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(padding5),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined, color: KStyles.blackColor, size: 25),
                                  SizedBox(
                                    width: padding5,
                                  ),
                                  Icon(Icons.keyboard_arrow_down, color: KStyles.blackColor, size: 25)
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  buildRepportSection(title: "Situation", items: ["Vente", "Achats"]),//
                  const SizedBox(height: 20),
                  buildRepportSection(title: "Chiffre d’affaire", items: ["Quotidien", "Hebdomadaire", "Mensuel", "Annuel"]),
                ],
              ),
          ],
        ),
      ),
    )
    );
  }

  Future<void> saveDataCurrentPosToLocal(PosDataResponse data) async {
    await AppStorage.instance.setInstance(key: dataPos, value: data);
    await AppServices.instance.checkCurrentPosData();
    Future.microtask((){
      _refreshData();
    });
  }
}
