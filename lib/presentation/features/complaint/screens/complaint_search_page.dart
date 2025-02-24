import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/configs/injection_container.dart';
import '../../../../domain/entities/complaint/complaint_data_response.dart';
import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../_widgets/paged_first_error.dart';
import '../../../_widgets/paged_new_page_error.dart';
import '../../../controllers/complaint_ctrl.dart';
import '../../../res/app_input_styles.dart';
import '../../../res/style/e_style.dart';
import 'complaint_detail_page.dart';



class ComplaintSearchPage extends StatefulWidget {
  const ComplaintSearchPage({super.key});

  @override
  State<ComplaintSearchPage> createState() => _ComplaintSearchPageState();
}

class _ComplaintSearchPageState extends State<ComplaintSearchPage> {

  final complaintCtrl = locator<ComplaintCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    complaintCtrl.pagingComplaintController = PagingController<int, ComplaintDataResponse>(firstPageKey: 0);
    complaintCtrl.pagingComplaintController?.addPageRequestListener((pageKey) {
      complaintCtrl.dataListPlainte();
    });

    searchController = TextEditingController();
    searchController?.addListener(() {
      complaintCtrl.searchComplaints(searchController!.text);
    });
  }


  @override
  void dispose() {
    super.dispose();
    complaintCtrl.pagingComplaintController?.dispose();
    complaintCtrl.pagingComplaintController = null;
    searchController?.dispose();
  }


  Widget noItem(){
    return Center(
      child: buildText(context, "Aucune plainte trouvé.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }

  Widget buildList(ComplaintDataResponse item)
  {
    return InkWell(
      onTap: () => Get.to(() => ComplaintDetailPage(complaint: item)),
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
                      context, item.category?.name??"", 11, KStyles.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Flexible(
                flex: 1,
                child: buildText(context, item.status??"", 12,
                    KStyles.blackColor, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: padding),
          buildText(context, item.subject??"", 12, maxLine: 3,
              KStyles.blackColor, fontWeight: FontWeight.w500),
          const SizedBox(height: padding),
          buildText(context, "@${item.concernName??""}", 12,
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
      appBar: appBarOther(context, "Rechercher une plainte"),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => complaintCtrl.pagingComplaintController?.refresh()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                decoration: AppInputStyles.searchInput("Rechercher une plainte"),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: LayoutBuilder(
                builder: (_, cxs) {
                  return PagedListView<int, ComplaintDataResponse>.separated(
                    pagingController: complaintCtrl.pagingComplaintController!,
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Divider(
                          height: 1, thickness: 1, color: Colors.grey.shade300),
                    ),
                    builderDelegate: PagedChildBuilderDelegate<ComplaintDataResponse>(
                      itemBuilder: (context, item, index) {
                        return Padding(
                            padding:EdgeInsets.symmetric(horizontal: padding),
                            child: buildList(item),
                        );
                      },
                      firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                      newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                      noItemsFoundIndicatorBuilder: (_) => noItem(),
                      firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: complaintCtrl.pagingComplaintController, cxs: cxs),
                      newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: complaintCtrl.pagingComplaintController),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
