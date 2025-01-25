import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/customer_ctrl.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../res/app_input_styles.dart';

class CustomerCategoryPage extends StatefulWidget {
  const CustomerCategoryPage({super.key});

  @override
  State<CustomerCategoryPage> createState() => _CustomerCategoryPageState();
}

class _CustomerCategoryPageState extends State<CustomerCategoryPage> {

  final customerCtr = locator<CustomerCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    customerCtr.pagingCtgController = PagingController<int, CategoriesEntities>(firstPageKey: 0);
    customerCtr.pagingCtgController?.addPageRequestListener((pageKey) {
      customerCtr.allCtgData(pageKey);
    });

    searchController = TextEditingController();
    searchController?.addListener(() {
      customerCtr.searchCategories(searchController!.text);
    });
  }


  @override
  void dispose() {
    super.dispose();
    customerCtr.pagingCtgController?.dispose();
    customerCtr.pagingCtgController = null;
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
        appBar: appBarOther(context, "Catégorie de client",
            actionList: [
              /*IconButton(
                  onPressed: () async {},
                  icon: const Icon(CupertinoIcons.add_circled_solid,
                      color: KStyles.primaryColor, size: 32)
              ),*/
            ]),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() => customerCtr.pagingCtgController?.refresh()),
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
                    return PagedListView<int, CategoriesEntities>.separated(
                      pagingController: customerCtr.pagingCtgController!,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(
                            height: 1, thickness: 1, color: Colors.grey.shade300),
                      ),
                      builderDelegate: PagedChildBuilderDelegate<CategoriesEntities>(
                        itemBuilder: (context, ctg, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: KStyles.primaryColor.withOpacity(0.2),
                              child: const Icon(Iconsax.courthouse, color: KStyles.primaryColor),
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
                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: customerCtr.pagingCtgController, cxs: cxs),
                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: customerCtr.pagingCtgController),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
