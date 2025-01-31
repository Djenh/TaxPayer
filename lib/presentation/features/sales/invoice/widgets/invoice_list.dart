import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../screens/invoice_create_page.dart';
import '../screens/invoice_detail_page.dart';
import '../screens/invoice_search_page.dart';
import 'invoice_item.dart';


class InvoiceList extends StatefulWidget {
  const InvoiceList({super.key});

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {

  final invoiceCtr = locator<InvoiceCtrl>();
  String? tin;

  final List<String> filters = ["factures de ventes", "factures d’avoir"];
  int selectedFilter = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tin = AppServices.instance.currentCompany.value?.tin;
    invoiceCtr.pagingIvoiceController = PagingController<int, InvoiceResponse>(firstPageKey: 0);
    invoiceCtr.pagingIvoiceController?.addPageRequestListener((pageKey) {
      invoiceCtr.allInvoiceData(tin!,pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    invoiceCtr.pagingIvoiceController?.dispose();
    invoiceCtr.pagingIvoiceController = null;
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Chip(
          label: Text(
            label,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isSelected ? Colors.white : Colors.black54,
                fontSize: 12, fontWeight: FontWeight.w400
            ),
          ),
          backgroundColor: isSelected ? KStyles.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: isSelected ? KStyles.primaryColor : Colors.grey),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => invoiceCtr.pagingIvoiceController?.refresh()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarHome(context, "Les Factures",
            actionList: [
            IconButton(
                onPressed: () {
                  Get.to(() => const InvoiceSearchPage());
                }, icon: const Icon(Iconsax.search_normal)),
            IconButton(
                onPressed: () => Get.to(() => const InvoiceCreatePage()),
                icon: const Icon(CupertinoIcons.add_circled_solid,
                    color: KStyles.primaryColor, size: 32)
            ),
          ],
            bottomWidget: const TabBar(
              indicatorColor: KStyles.primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Ventes"),
                Tab(text: "Achats"),
              ],
            ),
            bgColor: Colors.white
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: filters.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final String filter = entry.value;

                    return _buildFilterChip(
                      filter,
                      selectedFilter == index,
                      () {
                        setState(() {
                          selectedFilter = index;
                        });
                        // TODO : Ajouter l'action pour filtrer les données
                        debugPrint("Filtre sélectionné : Index $index, Valeur $filter");
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, cxs) {
                    return PagedListView<int, InvoiceResponse>.separated(
                      pagingController: invoiceCtr.pagingIvoiceController!,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(
                            height: 1, thickness: 1, color: Colors.grey.shade300),
                      ),
                      builderDelegate: PagedChildBuilderDelegate<InvoiceResponse>(
                        itemBuilder: (context, typ, index) {
                          return InvoiceItem(
                            invoiceResponse: typ,
                            onTap: () => Get.to(() =>  InvoiceDetailPage(invoiceResponse: typ, isSaleInvoice: true)),
                          );
                        },
                        firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                        noItemsFoundIndicatorBuilder: (_) => noItem(),
                        firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: invoiceCtr.pagingIvoiceController, cxs: cxs),
                        newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: invoiceCtr.pagingIvoiceController),
                      ),
                    );
                  },
                )
              ),

              /*
              Expanded(
                child: itemList(),
              ),
               */
            ],
          ),
        )
      ),
    );
  }

  Widget noItem(){
    return Center(
      child: buildText(context, "Aucune facture trouvée.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }
}
