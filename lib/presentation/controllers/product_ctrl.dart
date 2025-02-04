import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_product_dto.dart';
import 'package:invoice_app/data/dtos/add_unit_dto.dart';
import 'package:invoice_app/data/dtos/pricing_dto.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/unit_m_list_response.dart';
import 'package:invoice_app/domain/usecases/product_uc.dart';
import 'dart:developer' as developer;


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
  PagingController<int, UnitMEntities>? pagingUmController;
  List<UnitMEntities> allUnitM = [];
  PagingController<int, CategoriesEntities>? pagingCtgController;
  PagingController<int, PricingResponse>? productPricesController;
  List<CategoriesEntities> allCategories = [];
  List<PricingResponse> productPrices = [];
  PagingController<int, ProductResponse>? pagingProdController;
  List<ProductResponse> allProducts = [];
  PagingController<int, TaxGroupEntities>? pagingTaxGroupController;
  List<TaxGroupEntities> allTaxGroup = [];


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


  Future<void> getProductPrices(String code, int pageKey) async {
    try {
      final result = await productUc.executePricingProductByCode(code,pageKey, _pageSize);

      result.fold(
            (failure) {
              productPricesController?.error = failure.message;
        },
            (response) {
          final List<PricingResponse> newItems = response.content ?? [];

          if (pageKey == 0) {
            productPrices.clear();
          }

          productPrices.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            productPricesController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            productPricesController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      productPricesController?.error = error.toString();
    }
  }

  ///func to create unit-of-measurements
  Future<UnitMEntities?> addUnitM(BuildContext context, AddUnitDto params) async {
    UnitMEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, UnitMEntities> result = await productUc.executeUnitMSave(params);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Unité de mesure',
            description: failure.message);
      }, (UnitMEntities unitData) {
        AppLogger.info("ctgData successful: ${unitData.toJson()}");
        ToastService.showSuccess(context, 'Unité de mesure',
            description: "Unité de mesure ajouté avec succès !");
        response = unitData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during addUnitM: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to update unit-of-measurements
  Future<UnitMEntities?> updUnitM(BuildContext context, String id, AddUnitDto params) async {
    UnitMEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, UnitMEntities> result =
                 await productUc.executeUnitMUpdate(id, params);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Unité de mesure',
            description: failure.message);
      }, (UnitMEntities unitData) {
        AppLogger.info("unitData successful: ${unitData.toJson()}");
        ToastService.showSuccess(context, 'Unité de mesure',
            description: "Unité de mesure modifier avec succès !");
        response = unitData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during updUnitM : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get all categories
  Future<void> allUnitMData(int pageKey) async {
    try {
      final result = await productUc.executeAllUnitM(pageKey, _pageSize);

      result.fold(
            (failure) {
              pagingUmController?.error = failure.message;
        },
            (response) {
          final List<UnitMEntities> newItems = response.content ?? [];

          if (pageKey == 0) {
            allUnitM.clear();
          }

          allUnitM.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            pagingUmController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            pagingUmController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingUmController?.error = error.toString();
    }
  }

  void searchUnitM(String query) {
    if (query.isEmpty) {
      pagingUmController?.itemList = allUnitM;
    } else {
      final filteredUnit = allUnitM.where((unit) {
        return unit.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      pagingUmController?.itemList = filteredUnit;
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
        return category.name!.toLowerCase().contains(query.toLowerCase()) ||
            category.code!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      pagingCtgController?.itemList = filteredCategories;
    }
  }


  ///func to create product
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

  ///func to modify product
  Future<ProductResponse?> mProduct(BuildContext context,String uid, AddProductDto params) async {
    ProductResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, ProductResponse> result = await productUc.executeProductM(uid, params);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Produits', description: failure.message);
      }, (ProductResponse prodData) {
        AppLogger.info("prodData successful: ${prodData.toJson()}");
        ToastService.showSuccess(context, 'Produits', description: "Produit modifier avec succès !");
        response = prodData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during mProduct: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get product by id
  Future<ProductResponse?> productById(BuildContext context,String uid) async {
    ProductResponse? response;

    try {
      //_setLoading(true);

      final Either<Failure, ProductResponse> result = await productUc.executeProductById(uid);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Produits', description: failure.message);
      }, (ProductResponse prodData) {
        AppLogger.info("prodData successful: ${prodData.toJson()}");
        response = prodData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during productById : $e');
      rethrow;
    } finally {
      //_setLoading(false);
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


  ///func to get all group tax
  Future<void> allTaxGroupData(int pageKey) async {
    try {
      final result = await productUc.executeAllTaxGroup(pageKey, _pageSize);

      result.fold(
            (failure) {
          pagingTaxGroupController?.error = failure.message;
          developer.log(
            'Unhandled Exception in Tax Group Data Fetch',
            name: 'allTaxGroupData',
            error: failure.message,
          );
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

  ///func to add price product
  Future<PricingResponse?> addPriceProd(BuildContext context,
      PricingDto params, {String? nameProd}) async {
    PricingResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, PricingResponse> result =
      await productUc.executeSetPricing(params);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Prix',
            description: failure.message);
      }, (PricingResponse priceData) {
        AppLogger.info("priceData successful: ${priceData.toJson()}");
        ToastService.showSuccess(context, 'Prix',
            description: "Prix du produit ${nameProd ?? ""} ajouté.");
        response = priceData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during addPriceProd : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }



}