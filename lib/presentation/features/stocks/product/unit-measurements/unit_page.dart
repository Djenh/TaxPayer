import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/product/unit_m_list_response.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/float_btn.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';
import 'package:invoice_app/presentation/features/stocks/product/unit-measurements/add_unit_page.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {

  final prodCtr = locator<ProductCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    prodCtr.pagingUmController = PagingController<int, UnitMEntities>(firstPageKey: 0);
    prodCtr.pagingUmController?.addPageRequestListener((pageKey) {
      prodCtr.allUnitMData(pageKey);
    });

    searchController = TextEditingController();
    searchController?.addListener(() {
      prodCtr.searchUnitM(searchController!.text);
    });
  }


  @override
  void dispose() {
    super.dispose();
    prodCtr.pagingUmController?.dispose();
    prodCtr.pagingUmController = null;
    searchController?.dispose();
  }


  Widget noItem(){
    return Center(
      child: buildText(context, "Aucune unité de mesure trouvé.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context, "Unité de mesure"),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() => prodCtr.pagingCtgController?.refresh()),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  decoration: AppInputStyles.searchInput("Rechercher une unité"),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, cxs) {
                    return PagedListView<int, UnitMEntities>.separated(
                      pagingController: prodCtr.pagingUmController!,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(
                            height: 1, thickness: 1, color: Colors.grey.shade300),
                      ),
                      builderDelegate: PagedChildBuilderDelegate<UnitMEntities>(
                        itemBuilder: (context, unit, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: KStyles.primaryColor.withOpacity(0.2),
                              child: const Icon(Iconsax.building, color: KStyles.primaryColor),
                            ),
                            title: Text(
                              "${unit.code}",
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              "${unit.name}",
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            onTap: () {
                              Get.back(result: unit);
                            },
                          );
                        },
                        firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        noItemsFoundIndicatorBuilder: (_) => noItem(),
                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: prodCtr.pagingUmController, cxs: cxs),
                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: prodCtr.pagingUmController),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatBtn(
        onAction: () async {
          await Get.to(() => const AddUnitPage(),
              fullscreenDialog: true)?.then((val){
            if(val == true){
              prodCtr.pagingUmController?.refresh();
            }
          });
        },
        icn: Iconsax.add,
      ),
    );
  }


}
