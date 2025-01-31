import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/_widgets/simple_btn.dart';
import 'package:invoice_app/presentation/controllers/customer_ctrl.dart';
import 'package:invoice_app/presentation/features/clients/widgets/item_customer.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';

import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../_widgets/float_btn.dart';
import '../../../res/style/e_style.dart';
import 'add_customer_page.dart';


class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  final customerCtr = locator<CustomerCtrl>();
  TextEditingController? searchController;


  @override
  void initState() {
    super.initState();
    customerCtr.pagingCusController = PagingController<int, CustomerEntities>(firstPageKey: 0);
    customerCtr.pagingCusController?.addPageRequestListener((pageKey) {
      customerCtr.allCustomerByTin(pageKey);
    });

    searchController = TextEditingController();
    searchController?.addListener(() {
      customerCtr.searchCustomer(searchController!.text);
    });
  }


  @override
  void dispose() {
    super.dispose();
    customerCtr.pagingCusController?.dispose();
    customerCtr.pagingCusController = null;
    searchController?.dispose();
  }


  Widget _noItem(){
    return (searchController!.text.isNotEmpty)
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Iconsax.user, color: KStyles.icColors, size: 64),
        const SizedBox(height: 10),
        buildText(context, "Aucun résultat", 18, Colors.black,
            fontWeight: FontWeight.w400),
        const SizedBox(height: 10),
        buildText(context, "Il n'existe aucun client portant ce nom.",
            12, Colors.black, fontWeight: FontWeight.w300,
            textAlign: TextAlign.center),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width/2+50,
          child: SimpleBtn(
            titleBtn: "Créer un client",
            sizeFont: 14,
            onPressed: () async {
              await Get.to(() => const AddCustomerPage(), fullscreenDialog: true)?.then((val){
                if(val == true){
                  customerCtr.pagingCusController?.refresh();
                }
              });
            },
          ),
        )
      ],
    )
        : Center(
      child: buildText(context, "Pas de client.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context,  widget.isManage
            ? "Clients"
            : "Sélectionner un client"
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() => customerCtr.pagingCusController?.refresh()),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  decoration: AppInputStyles.searchInput("Rechercher un client"),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, cxs) {
                    return PagedListView<int, CustomerEntities>.separated(
                      pagingController: customerCtr.pagingCusController!,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(
                            height: 1, thickness: 1, color: Colors.grey.shade300),
                      ),
                      builderDelegate: PagedChildBuilderDelegate<CustomerEntities>(
                        itemBuilder: (context, cus, index) {
                          return ItemCustomer(cusData: cus, onAction: () {
                            if(widget.isManage){
                              //Get.to(() => const ClientDetailPage());
                            }else{
                              Get.back(result: cus);
                            }
                          });
                        },
                        firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        noItemsFoundIndicatorBuilder: (_) => _noItem(),
                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: customerCtr.pagingCusController, cxs: cxs),
                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: customerCtr.pagingCusController),
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
          await Get.to(() => const AddCustomerPage(),
              fullscreenDialog: true)?.then((val){
            if(val == true){
              customerCtr.pagingCusController?.refresh();
            }
          });
        },
        icn: Iconsax.add,
      )
          : null,
    );
  }

}
