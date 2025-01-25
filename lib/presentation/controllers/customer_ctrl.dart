import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_customer_dto.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/usecases/customer_uc.dart';
import 'package:invoice_app/utils/logger_util.dart';

class CustomerCtrl extends GetxController {

  CustomerCtrl({required this.customerUc});

  final CustomerUc customerUc;


  RxBool isLoading = false.obs;
  RxBool isLoadingLoc = false.obs;
  static const _pageSize = 20;
  var currentPage = 1.obs;
  PagingController<int, CustomerEntities>? pagingCusController;
  List<CustomerEntities> allCustomers = [];
  PagingController<int, CategoriesEntities>? pagingCtgController;
  List<CategoriesEntities> allCategories = [];
  var locationMessage = RxString("Cliquez pour obtenir votre localisation");


  RxBool get ignorePointer => RxBool(isLoading.isTrue || isLoadingLoc.isTrue);

  void _setLoading(bool value) => isLoading.value = value;
  void _setLoadingLoc(bool value) => isLoadingLoc.value = value;

  void onPopInvoked(bool didPop) {
    if (didPop) {
      return;
    }
    if (isLoading.isFalse) {
      Get.back();
    }
  }


  /// Méthode pour récupérer la localisation
  Future<Position?> getCurrentLocation() async {
    try {
      _setLoadingLoc(true);

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationMessage.value = "Le service de localisation est désactivé.";
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationMessage.value = "Les permissions de localisation sont refusées.";
        }
      }

      if (permission == LocationPermission.deniedForever) {
        locationMessage.value = "Les permissions de localisation sont refusées de manière permanente.";
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      locationMessage.value = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      return position;
    } catch (e) {
      locationMessage.value = "Erreur lors de la récupération de la localisation : $e";
    }finally {
      _setLoadingLoc(false);
    }
    return null;
  }


  ///func to add customer for company
  Future<CustomerEntities?> addCustomerForCompany(BuildContext context, AddCustomerDto params) async {
    CustomerEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, CustomerEntities> result = await customerUc.executeSaveCustomer(params);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
        ToastService.showError(context, 'Client', description: failure.message);
      }, (CustomerEntities cusData) {
        AppLogger.info("cusData successful: ${cusData.toJson()}");
        ToastService.showSuccess(context, 'Client', description: "Client enregistrer avec succès !");
        response = cusData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during addCustomerForCompany : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to update customer for company
  Future<CustomerEntities?> updateCustomerForCompany(BuildContext context, String id, AddCustomerDto params) async {
    CustomerEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, CustomerEntities> result = await customerUc.executeUpdCustomer(id, params);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
        ToastService.showError(context, 'Point de vente', description: failure.message);
      }, (CustomerEntities cusData) {
        AppLogger.info("cusData successful: ${cusData.toJson()}");
        ToastService.showSuccess(context, 'Client', description: "Client modifier avec succès !");
        response = cusData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during updateCustomerForCompany : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get all customer for company by tin
  Future<void> allCustomerByTin(int pageKey) async {

    String? tin = AppServices.instance.currentCompany.value?.tin;

    try {
      final result = await customerUc.executeListCustomerByTin(tin!, pageKey, _pageSize);

      result.fold(
            (failure) {
              pagingCusController?.error = failure.message;
        },
            (response) {
          final List<CustomerEntities> newItems = response.content ?? [];

          if (pageKey == 0) {
            allCustomers.clear();
          }

          allCustomers.addAll(newItems);

          final isLastPage = pageKey >= (response.totalPages ?? 1) - 1;
          if (isLastPage) {
            pagingCusController?.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            pagingCusController?.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingCusController?.error = error.toString();
    }
  }

  void searchCustomer(String query) {
    if (query.isEmpty) {
      pagingCusController?.itemList = allCustomers;
    } else {
      final filteredCustomer = allCustomers.where((cus) {
        return cus.name!.toLowerCase().contains(query.toLowerCase())
            || cus.name!.toUpperCase().contains(query.toUpperCase());
      }).toList();

      pagingCusController?.itemList = filteredCustomer;
    }
  }

  ///func to get customer by tin & code
  Future<CustomerEntities?> dataCustomerByTinCode(String tin, String code) async {
    CustomerEntities? response;
    String? tin = AppServices.instance.currentCompany.value?.tin;


    try {
      _setLoading(true);

      final Either<Failure, CustomerEntities> result =
      await customerUc.executeCustomerByTinCode(tin!, code);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
      }, (CustomerEntities cusData) {
        if (cusData.ownerTin == tin) {
          AppLogger.info("cusData successful: $cusData");
          response = cusData;
        }
      });
    } catch (e) {
      AppLogger.error('An error occurred during dataCustomerByTinCode : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get customer by code
  Future<CustomerEntities?> dataCustomerByCode(String code) async {
    CustomerEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, CustomerEntities> result =
          await customerUc.executeCustomerByCode(code);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
      }, (CustomerEntities cusData) {
        AppLogger.info("cusData successful: $cusData");
        response = cusData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during dataCustomerByCode : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to create categories
  Future<CategoriesEntities?> addCategoryCustomer(BuildContext context, AddCategoryDto params) async {
    CategoriesEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, CategoriesEntities> result = await customerUc.executeCategorySave(params);

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
      final result = await customerUc.executeAllCategory(pageKey, _pageSize);

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


}