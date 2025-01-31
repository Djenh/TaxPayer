import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';

import '../../../../../core/configs/injection_container.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/paged_first_error.dart';
import '../../../../_widgets/paged_new_page_error.dart';
import '../../../../res/style/e_style.dart';


class TaxGroupPage extends StatefulWidget {
  const TaxGroupPage({super.key});

  @override
  State<TaxGroupPage> createState() => _TaxGroupState();
}

class _TaxGroupState extends State<TaxGroupPage> {

  final prodCtr = locator<ProductCtrl>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prodCtr.pagingTaxGroupController = PagingController<int, TaxGroupEntities>(firstPageKey: 0);
    prodCtr.pagingTaxGroupController?.addPageRequestListener((pageKey) {
      prodCtr.allTaxGroupData(pageKey);
    });
  }


  @override
  void dispose() {
    super.dispose();
    prodCtr.pagingTaxGroupController?.dispose();
    prodCtr.pagingTaxGroupController = null;
  }


  Widget noItem(){
    return Center(
      child: buildText(context, "Aucun tax de groupe trouvé.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Choisir une taxation"),
      body: RefreshIndicator(
          onRefresh: () => Future.sync(() => prodCtr.pagingTaxGroupController?.refresh()),
          child: LayoutBuilder(
            builder: (_, cxs) {
              return PagedListView<int, TaxGroupEntities>.separated(
                pagingController: prodCtr.pagingTaxGroupController!,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(
                      height: 1, thickness: 1, color: Colors.grey.shade300),
                ),
                builderDelegate: PagedChildBuilderDelegate<TaxGroupEntities>(
                  itemBuilder: (context, gp, index) {
                    final String letter = String.fromCharCode(65 + index % 26);

                    return InkWell(
                      onTap: (){
                        Get.back(result: gp);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: KStyles.primaryColor.withOpacity(0.2),
                              child: Text(
                                letter,
                                style: const TextStyle(color: KStyles.primaryColor, fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildText(context, gp.name!, 14, Colors.black,
                                      fontWeight: FontWeight.w700),
                                  /*const SizedBox(height: 4),
                                  buildText(context, dat["desc"]!, 12, Colors.black,
                                      fontWeight: FontWeight.w300)*/
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    buildText(context, "Taux", 14, Colors.black,
                                        fontWeight: FontWeight.w500),
                                    const SizedBox(height: 4),
                                    buildText(context, "${gp.rate}%", 12, Colors.black,
                                        fontWeight: FontWeight.w300),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                  newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                  noItemsFoundIndicatorBuilder: (_) => noItem(),
                  firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: prodCtr.pagingTaxGroupController, cxs: cxs),
                  newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: prodCtr.pagingTaxGroupController),
                ),
              );
            },
          ),
        )
    );
  }
}

