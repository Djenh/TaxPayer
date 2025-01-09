import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/app_bar_custom.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/paged_first_error.dart';
import '../../../../_widgets/paged_new_page_error.dart';



class TypeInvoicePage extends StatefulWidget {
  const TypeInvoicePage({super.key});

  @override
  State<TypeInvoicePage> createState() => _TypeInvoicePageState();
}

class _TypeInvoicePageState extends State<TypeInvoicePage> {

  final invoiceCtr = locator<InvoiceCtrl>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceCtr.pagingTypeInvoiceController = PagingController<int, TypeInvoiceEntities>(firstPageKey: 0);
    invoiceCtr.pagingTypeInvoiceController?.addPageRequestListener((pageKey) {
      invoiceCtr.allTypeInvoiceData(pageKey);
    });
  }


  @override
  void dispose() {
    super.dispose();
    invoiceCtr.pagingTypeInvoiceController?.dispose();
    invoiceCtr.pagingTypeInvoiceController = null;
  }


  Widget noItem(){
    return Center(
      child: buildText(context, "Aucun type de facture trouvé.", 16, Colors.black,
          fontWeight: FontWeight.w500, textAlign: TextAlign.center),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Choisir un type de facture"),
      body: RefreshIndicator(
          onRefresh: () => Future.sync(() => invoiceCtr.pagingTypeInvoiceController?.refresh()),
          child: LayoutBuilder(
            builder: (_, cxs) {
              return PagedListView<int, TypeInvoiceEntities>.separated(
                pagingController: invoiceCtr.pagingTypeInvoiceController!,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(
                      height: 1, thickness: 1, color: Colors.grey.shade300),
                ),
                builderDelegate: PagedChildBuilderDelegate<TypeInvoiceEntities>(
                  itemBuilder: (context, typ, index) {
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
                      title: buildText(context, typ.name!, 14, Colors.black, fontWeight: FontWeight.w600),
                      /*subtitle: Text(
                        "description",
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),*/
                      onTap: () {
                        Get.back(result: typ);
                      },
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                  newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                  noItemsFoundIndicatorBuilder: (_) => noItem(),
                  firstPageErrorIndicatorBuilder: (_) => PagedFirstError(pagingController: invoiceCtr.pagingTypeInvoiceController, cxs: cxs),
                  newPageErrorIndicatorBuilder: (_) => PagedNewPageError(pagingController: invoiceCtr.pagingTypeInvoiceController),
                ),
              );
            },
          ),
        )
    );
  }

}
