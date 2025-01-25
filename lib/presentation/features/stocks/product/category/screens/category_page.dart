import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';

import '../../../../../../core/configs/injection_container.dart';
import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../_widgets/paged_first_error.dart';
import '../../../../../_widgets/paged_new_page_error.dart';
import '../../../../../controllers/product_ctrl.dart';
import '../../../../../res/style/e_style.dart';
import 'add_category_page.dart';


class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  final prodCtr = locator<ProductCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    prodCtr.pagingCtgController = PagingController<int, CategoriesEntities>(firstPageKey: 0);
    prodCtr.pagingCtgController?.addPageRequestListener((pageKey) {
      prodCtr.allCtgData(pageKey);
    });

    searchController = TextEditingController();
    searchController?.addListener(() {
      prodCtr.searchCategories(searchController!.text);
    });
  }


  @override
  void dispose() {
    super.dispose();
    prodCtr.pagingCtgController?.dispose();
    prodCtr.pagingCtgController = null;
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
        appBar: widget.isManage
            ? appBarOther(context, "Catégorie de produit",
                   actionList: [
            /*IconButton(
                onPressed: () {
                  Get.to(() => const CategorySearchPage(isManage: true));
                }, icon: const Icon(Iconsax.search_normal)),*/
            IconButton(
                onPressed: () async {
                  await Get.to(() => const AddCategoryPage())?.then((val){
                    if(val == true){
                      prodCtr.pagingCtgController?.refresh();
                    }
                  });
                },
                icon: const Icon(CupertinoIcons.add_circled_solid,
                    color: KStyles.primaryColor, size: 32)
            ),
          ])
            : appBarOther(context, "Choisir une catégorie"),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() => prodCtr.pagingCtgController?.refresh()),
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
                      pagingController: prodCtr.pagingCtgController!,
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
                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: prodCtr.pagingCtgController, cxs: cxs),
                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: prodCtr.pagingCtgController),
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
