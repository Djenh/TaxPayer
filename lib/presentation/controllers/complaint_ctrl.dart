import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/utils/logger_util.dart';

import '../../core/services/toast_service.dart';
import '../../data/dtos/complaint/add_category_complaint_dto.dart';
import '../../data/dtos/complaint/add_complaint_dto.dart';
import '../../domain/entities/complaint/category_complaint_entities.dart';
import '../../domain/entities/complaint/complaint_data_response.dart';
import '../../domain/entities/complaint/complaint_list_response.dart';
import '../../domain/usecases/complaint_uc.dart';


class ComplaintCtrl extends GetxController {
  ComplaintCtrl({required this.complaintUc});

  final ComplaintUc complaintUc;

  RxBool isLoading = false.obs;
  var currentPage = 1.obs;
  final int _page = 0;
  static const int _pageSize = 20;
  RxBool get ignorePointer => RxBool(isLoading.isTrue);
  void _setLoading(bool value) => isLoading.value = value;
  PagingController<int, CategoryComplaintEntities>? pagingCtgController;
  List<CategoryComplaintEntities> allCategories = [];

  PagingController<int, ComplaintDataResponse>? pagingComplaintController;
  List<ComplaintDataResponse> allComplaints = [];


  void onPopInvoked(bool didPop) {
    if (didPop) {
      return;
    }
    if (isLoading.isFalse) {
      Get.back();
    }
  }


  ///func to add complaint
  Future<ComplaintDataResponse?> addComplaint(BuildContext context, AddComplaintDto params) async {
    ComplaintDataResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, ComplaintDataResponse> result = await complaintUc.executeSaveComplaint(params);

      result.fold(
              (Failure failure) {
                AppLogger.error("fetch data failed: ${failure.message}");
                ToastService.showError(context, 'Plainte', description: failure.message);
              },
              (ComplaintDataResponse plainteData) {
                AppLogger.info("plainteData successful: ${plainteData.toJson()}");
                ToastService.showSuccess(context, 'Plainte', description: "Plainte enregistrée !");
                response = plainteData;
              });
    } catch (e) {
      AppLogger.error('An error occurred during saveComplaint: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }


  ///func to get list complaint
  Future<List<ComplaintDataResponse>?> dataListPlainte() async {
    List<ComplaintDataResponse>? myResponse;

    try {
      _setLoading(true);

      final Either<Failure, ComplaintListResponse> result =
            await complaintUc.executeListComplaint(_page, _pageSize);

      result.fold(
              (Failure failure) {
            AppLogger.error("fetch data failed: ${failure.message}");
            pagingComplaintController?.error = failure.message;
          },
              (ComplaintListResponse response) {
            final List<ComplaintDataResponse> complaintListData = response.content??[];
            AppLogger.info("complaintListData successful: $complaintListData");
            myResponse = complaintListData;

            if (_page == 0) {
              allComplaints.clear();
            }
            allComplaints.addAll(complaintListData);

            final isLastPage = _page >= (response.totalPages ?? 1) - 1;
            if (isLastPage) {
              pagingComplaintController?.appendLastPage(complaintListData);
            } else {
              final nextPageKey = _page + 1;
              pagingComplaintController?.appendPage(complaintListData, nextPageKey);
            }
          }
      );
    } catch (e) {
      AppLogger.error('An error occurred during dataListLotteryParticipation: $e');
      pagingComplaintController?.error = e.toString();
      rethrow;
    } finally {
      _setLoading(false);
    }

    return myResponse;
  }

  void searchComplaints(String query) {
    if (query.isEmpty) {
      pagingComplaintController?.itemList = allComplaints;
    } else {
      final filteredComplaints = allComplaints.where((complaint) {
        return complaint.subject!.toLowerCase().contains(query.toLowerCase()) ||
            complaint.concernName!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      pagingComplaintController?.itemList = filteredComplaints;
    }
  }


  ///func to create category of complaint
  Future<CategoryComplaintEntities?> addCategory(BuildContext context, AddCategoryComplaintDto params) async {
    CategoryComplaintEntities? response;

    try {
      _setLoading(true);

      final Either<Failure, CategoryComplaintEntities> result = await complaintUc.executeCategorySave(params);

      result.fold((Failure failure) {
        AppLogger.error("data save failed: ${failure.message}");
        ToastService.showError(context, 'Categories', description: failure.message);
      }, (CategoryComplaintEntities ctgData) {
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


  ///func to get all categories of complaint
  Future<void> allCategoryData(int pageKey) async {
    try {
      final result = await complaintUc.executeAllCategory(pageKey, _pageSize);

      result.fold(
            (failure) {
          pagingCtgController?.error = failure.message;
        },
            (response) {
          final List<CategoryComplaintEntities> newItems = response.content ?? [];

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
