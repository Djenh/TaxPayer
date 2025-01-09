import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';

import '../../../../../core/configs/injection_container.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/build_text.dart';
import '../../../../_widgets/paged_first_error.dart';
import '../../../../_widgets/paged_new_page_error.dart';
import '../../../../res/style/e_style.dart';


class SecurityTaxPage extends StatefulWidget {
  const SecurityTaxPage({super.key});

  @override
  State<SecurityTaxPage> createState() => _SecurityTaxPageState();
}

class _SecurityTaxPageState extends State<SecurityTaxPage> {

  final invoiceCtr = locator<InvoiceCtrl>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceCtr.pagingDepositTaxController = PagingController<int, DepositTaxEntities>(firstPageKey: 0);
    invoiceCtr.pagingDepositTaxController?.addPageRequestListener((pageKey) {
      invoiceCtr.allDepositTaxData(pageKey);
    });
  }


  @override
  void dispose() {
    super.dispose();
    invoiceCtr.pagingDepositTaxController?.dispose();
    invoiceCtr.pagingDepositTaxController = null;
  }


  Widget noItem(){
    return Center(
      child: buildText(context, "Aucun tax de sécurité trouvé.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Taxes de sécurité"),
      body: RefreshIndicator(
          onRefresh: () => Future.sync(() => invoiceCtr.pagingDepositTaxController?.refresh()),
          child: LayoutBuilder(
            builder: (_, cxs) {
              return PagedListView<int, DepositTaxEntities>.separated(
                pagingController: invoiceCtr.pagingDepositTaxController!,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(
                      height: 1, thickness: 1, color: Colors.grey.shade300),
                ),
                builderDelegate: PagedChildBuilderDelegate<DepositTaxEntities>(
                  itemBuilder: (context, dps, index) {
                    final String letter = String.fromCharCode(65 + index % 26);

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: KStyles.primaryColor,
                        child: Text(
                          letter,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: buildText(context, "${dps.name}(${dps.rate}%)",
                            14, Colors.black, fontWeight: FontWeight.w600),
                      /*subtitle: Text(
                        tax["description"]!,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),*/
                      onTap: () {
                        Get.back(result: dps);
                      },
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                  newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                  noItemsFoundIndicatorBuilder: (_) => noItem(),
                  firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: invoiceCtr.pagingDepositTaxController, cxs: cxs),
                  newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: invoiceCtr.pagingDepositTaxController),
                ),
              );
            },
          ),
        )
    );
  }


}
