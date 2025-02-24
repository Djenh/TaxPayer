import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/float_btn.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';

import '../../../../../../core/configs/injection_container.dart';

import '../../../../../domain/entities/complaint/category_complaint_entities.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/paged_first_error.dart';
import '../../../../_widgets/paged_new_page_error.dart';
import '../../../../controllers/complaint_ctrl.dart';
import '../../../../res/style/e_style.dart';
import 'add_category_complaint_page.dart';


class CategoryComplaintPage extends StatefulWidget {
  const CategoryComplaintPage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<CategoryComplaintPage> createState() => _CategoryComplaintPageState();
}

class _CategoryComplaintPageState extends State<CategoryComplaintPage> {

  final complaintCtrl = locator<ComplaintCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    complaintCtrl.pagingCtgController = PagingController<int, CategoryComplaintEntities>(firstPageKey: 0);
    complaintCtrl.pagingCtgController?.addPageRequestListener((pageKey) {
      complaintCtrl.allCategoryData(pageKey);
    });

    searchController = TextEditingController();
    searchController?.addListener(() {
      complaintCtrl.searchCategories(searchController!.text);
    });
  }


  @override
  void dispose() {
    super.dispose();
    complaintCtrl.pagingCtgController?.dispose();
    complaintCtrl.pagingCtgController = null;
    searchController?.dispose();
  }


  Widget noItem(){
    return Center(
      child: buildText(context, "Aucune categorie trouvé.", 16, Colors.black,
         fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context, widget.isManage
            ? "Catégorie de plainte"
            : "Choisir une catégorie"
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() => complaintCtrl.pagingCtgController?.refresh()),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  decoration: AppInputStyles.searchInput("Rechercher categorie"),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, cxs) {
                    return PagedListView<int, CategoryComplaintEntities>.separated(
                      pagingController: complaintCtrl.pagingCtgController!,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(
                            height: 1, thickness: 1, color: Colors.grey.shade300),
                      ),
                      builderDelegate: PagedChildBuilderDelegate<CategoryComplaintEntities>(
                        itemBuilder: (context, ctg, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: KStyles.primaryColor.withOpacity(0.2),
                              child: const Icon(Iconsax.building, color: KStyles.primaryColor),
                            ),
                            title: Text(
                              "${ctg.code}",
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              "${ctg.name}",
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            onTap: () {
                              Get.back(result: ctg);
                            },
                          );
                        },
                        firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        noItemsFoundIndicatorBuilder: (_) => noItem(),
                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: complaintCtrl.pagingCtgController, cxs: cxs),
                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: complaintCtrl.pagingCtgController),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      floatingActionButton: widget.isManage
          ? FloatBtn(
        onAction: () async {
          await Get.to(() => const AddCategoryComplaintPage(),
              fullscreenDialog: true)?.then((val){
            if(val == true){
              complaintCtrl.pagingCtgController?.refresh();
            }
          });
        },
        icn: Iconsax.add,
      )
          : null,
    );
  }

}
