import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/domain/usecases/invoice_sifec_uc.dart';
import 'package:invoice_app/presentation/_widgets/app_loader.dart';
//import 'dart:developer' as developer;

import 'package:invoice_app/utils/logger_util.dart';



class InvoiceSifecCtrl extends GetxController {
  InvoiceSifecCtrl({required this.invoiceSifeUc});

  final InvoiceSifeUc invoiceSifeUc;


  RxBool isLoading = false.obs;
  static const _pageSize = 20;
  PagingController<int, TypeInvoiceEntities>? pagingTypeInvoiceController;
  PagingController<int, InvoiceResponse> pagingIvoiceController = PagingController<int, InvoiceResponse>(firstPageKey: 0);
  List<TypeInvoiceEntities> allTypeInvoice = [];
  List<InvoiceResponse> allInvoice = [];
  PagingController<int, DepositTaxEntities>? pagingDepositTaxController;
  List<DepositTaxEntities> allDepositTax = [];


  RxBool get ignorePointer => RxBool(isLoading.isTrue);

  void _setLoading(bool value) => isLoading.value = value;

  ///func to verify invoice
  Future<InvoiceResponse?> invoiceVerify(BuildContext context, String sig, bool isManuel) async {
    InvoiceResponse? response;

    try {
      !isManuel
          ? AppLoaderDialog.show(context)
          : _setLoading(true);

      final Either<Failure, InvoiceResponse> result =
      await invoiceSifeUc.executeInvoiceVerify(sig);

      result.fold((Failure failure) {
        AppLogger.error("verify invoice failed: ${failure.message}");
        ToastService.showError(context, 'Verification Facture',
            description: failure.message);
      }, (InvoiceResponse invData) {
        AppLogger.info("verify invoice successful: ${invData.toJson()}");
        //ToastService.showSuccess(context, 'Verification Facture', description: "Facture d'avoir crée avec succès.");
        response = invData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during invoiceCreditSetData : $e');
      rethrow;
    } finally {
      if(context.mounted) {
        !isManuel
            ? AppLoaderDialog.dismiss(context)
            : _setLoading(false);
      }
    }

    return response;
  }

}