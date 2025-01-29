import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/add_invoice_dto.dart';
import 'package:invoice_app/data/dtos/pricing_dto.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/domain/usecases/invoice_uc.dart';
import 'package:invoice_app/presentation/_widgets/app_loader.dart';
import 'dart:developer' as developer;

import 'package:invoice_app/utils/logger_util.dart';



class InvoiceCtrl extends GetxController {
  InvoiceCtrl({required this.invoiceUc});

  final InvoiceUc invoiceUc;

  RxBool isLoading = false.obs;
  static const _pageSize = 20;
  PagingController<int, TypeInvoiceEntities>? pagingTypeInvoiceController;
  List<TypeInvoiceEntities> allTypeInvoice = [];
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

  RxList<ItemInvoiceDto> finalItemInvoice = <ItemInvoiceDto>[].obs;

  Rx<AddInvoiceDto> addInvoiceDto = AddInvoiceDto(
      clientCode: "",
      typeInvoiceCode: "",
      tin: AppServices.instance.currentCompany.value!.tin!,
      posCode: AppServices.instance.currentPos.value!.code!,
      securityTaxCode: "",
      items: []
  ).obs;

  restInvoiceDto(){
    addInvoiceDto.value = AddInvoiceDto(
        clientCode: "",
        typeInvoiceCode: "",
        tin: AppServices.instance.currentCompany.value!.tin!,
        posCode: AppServices.instance.currentPos.value!.code!,
        securityTaxCode: "",
        items: []
    );
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


  ///func to calculate invoice item
  Future<InvoiceResponse?> invoiceCalculation(BuildContext context,
      AddInvoiceDto params) async {
    InvoiceResponse? response;

    try {
      //_setLoading(true);
      AppLoaderDialog.show(context);

      final Either<Failure, InvoiceResponse> result =
      await invoiceUc.executeCalculationInvoice(params);

      result.fold((Failure failure) {
        AppLogger.error("calculation invoice failed: ${failure.message}");
        ToastService.showError(context, 'Facturation',
            description: failure.message);
      }, (InvoiceResponse invData) {
        AppLogger.info("calculation invoice successful: ${invData.toJson()}");
        //ToastService.showSuccess(context, 'Facturation', description: "");
        response = invData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during invoiceCalculation: $e');
      rethrow;
    } finally {
      if(context.mounted) {
        AppLoaderDialog.dismiss(context);
      }
      _setLoading(false);
    }

    return response;
  }


  ///func to create invoice
  Future<InvoiceResponse?> invoiceSetData(BuildContext context,
      AddInvoiceDto params) async {
    InvoiceResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, InvoiceResponse> result =
               await invoiceUc.executeAddInvoice(params);

      result.fold((Failure failure) {
        AppLogger.error("create invoice failed: ${failure.message}");
        ToastService.showError(context, 'Facturation',
            description: failure.message);
      }, (InvoiceResponse invData) {
        AppLogger.info("create invoice successful: ${invData.toJson()}");
        ToastService.showSuccess(context, 'Facturation',
            description: "Facture crée avec succès.");
        response = invData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during invoiceSetData : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

}