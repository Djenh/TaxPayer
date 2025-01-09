import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/domain/usecases/invoice_uc.dart';


class InvoiceCtrl extends GetxController {
  InvoiceCtrl({required this.invoiceUc});

  final InvoiceUc invoiceUc;

  RxBool isLoading = false.obs;
  static const _pageSize = 20;
  PagingController<int, TypeInvoiceEntities>? pagingTypeInvoiceController;
  List<TypeInvoiceEntities> allTypeInvoice = [];
  PagingController<int, TaxGroupEntities>? pagingTaxGroupController;
  List<TaxGroupEntities> allTaxGroup = [];
  PagingController<int, DepositTaxEntities>? pagingDepositTaxController;
  List<DepositTaxEntities> allDepositTax = [];

  RxBool get ignorePointer => RxBool(isLoading.isTrue);

  void _setLoading(bool value) => isLoading.value = value;

  void onPopInvoked(bool didPop) {
    if (didPop) {
      return;
    }
    if (isLoading.isFalse) {
      Get.back();
    }
  }


  ///func to get all type invoice
  Future<void> allTypeInvoiceData(int pageKey) async {
    try {
      final result = await invoiceUc.executeAllTypeInvoice(pageKey, _pageSize);

      result.fold(
            (failure) {
              pagingTypeInvoiceController?.error = failure.message;
        },
            (response) {
          final List<TypeInvoiceEntities> newItems = response.content ?? [];

          if (pageKey == 0) {
            allTypeInvoice.clear();
          }

          allTypeInvoice.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            pagingTypeInvoiceController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            pagingTypeInvoiceController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingTypeInvoiceController?.error = error.toString();
    }
  }

  ///func to get all deposit tax
  Future<void> allDepositTaxData(int pageKey) async {
    try {
      final result = await invoiceUc.executeAllDepositTax(pageKey, _pageSize);

      result.fold(
            (failure) {
              pagingDepositTaxController?.error = failure.message;
        },
            (response) {
          final List<DepositTaxEntities> newItems = response.content ?? [];

          if (pageKey == 0) {
            allDepositTax.clear();
          }

          allDepositTax.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            pagingDepositTaxController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            pagingDepositTaxController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingDepositTaxController?.error = error.toString();
    }
  }

  ///func to get all group tax
  Future<void> allTaxGroupData(int pageKey) async {
    try {
      final result = await invoiceUc.executeAllTaxGroup(pageKey, _pageSize);

      result.fold(
            (failure) {
              pagingTaxGroupController?.error = failure.message;
        },
            (response) {
          final List<TaxGroupEntities> newItems = response.content ?? [];

          if (pageKey == 0) {
            allTaxGroup.clear();
          }

          allTaxGroup.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            pagingTaxGroupController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            pagingTaxGroupController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingTaxGroupController?.error = error.toString();
    }
  }

}