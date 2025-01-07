import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_product_dto.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/usecases/product_uc.dart';

import '../../core/errors/request_failures.dart';
import '../../core/services/toast_service.dart';
import '../../domain/entities/product/product_response.dart';
import '../../utils/logger_util.dart';

class ProductCtrl extends GetxController {
  ProductCtrl({required this.productUc});

  final ProductUc productUc;


  RxBool isLoading = false.obs;
  static const _pageSize = 20;
  var currentPageC = 1.obs;
  PagingController<int, CategoriesEntities>? pagingCtgController;
  List<CategoriesEntities> allCategories = [];
  PagingController<int, ProductResponse>? pagingProdController;
  List<ProductResponse> allProducts = [];


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


  ///func to create categories
  Future<CategoriesEntities?> addCategory(BuildContext context, AddCategoryDto params) async {
    CategoriesEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, CategoriesEntities> result = await productUc.executeCategorySave(params);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Categories', description: failure.message);
      }, (CategoriesEntities ctgData) {
        AppLogger.info("ctgData successful: ${ctgData.toJson()}");
        ToastService.showSuccess(context, 'Categories', description: "Catégorie ajouté avec succès !");
        response = ctgData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during addCategory: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get all categories
  Future<void> allCtgData(int pageKey) async {
    try {
      final result = await productUc.executeAllCategory(pageKey, _pageSize);

      result.fold(
            (failure) {
              pagingCtgController?.error = failure.message;
        },
        (response) {
          final List<CategoriesEntities> newItems = response.content ?? [];

          if (pageKey == 0) {
            allCategories.clear();
          }

          allCategories.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            pagingCtgController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            pagingCtgController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingCtgController?.error = error.toString();
    }
  }

  void searchCategories(String query) {
    if (query.isEmpty) {
      pagingCtgController?.itemList = allCategories;
    } else {
      final filteredCategories = allCategories.where((category) {
        return category.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      pagingCtgController?.itemList = filteredCategories;
    }
  }


  ///func to product
  Future<ProductResponse?> addProduct(BuildContext context, AddProductDto params) async {
    ProductResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, ProductResponse> result = await productUc.executeProductSave(params);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Produits', description: failure.message);
      }, (ProductResponse prodData) {
        AppLogger.info("prodData successful: ${prodData.toJson()}");
        ToastService.showSuccess(context, 'Produits', description: "Produit enregistrer avec succès !");
        response = prodData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during addProduct: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get all product
  Future<void> allProductData(int pageKey) async {

    String? companyTin = AppServices.instance.currentCompany.value!.tin;

    try {
      final result = await productUc.executeAllProductByTin(companyTin!, pageKey, _pageSize);

      result.fold(
            (failure) {
              pagingProdController?.error = failure.message;
        },
            (response) {
          final List<ProductResponse> newItems = response.content ?? [];

          if (pageKey == 0) {
            allProducts.clear();
          }

          allProducts.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            pagingProdController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            pagingProdController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingProdController?.error = error.toString();
    }
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      pagingProdController?.itemList = allProducts;
    } else {
      final filteredProducts = allProducts.where((category) {
        return category.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      pagingProdController?.itemList = filteredProducts;
    }
  }


}