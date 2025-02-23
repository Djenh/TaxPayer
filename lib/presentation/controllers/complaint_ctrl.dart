import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/utils/logger_util.dart';

import '../../core/services/toast_service.dart';
import '../../data/dtos/add_complaint_dto.dart';
import '../../domain/entities/complaint/complaint_data_response.dart';
import '../../domain/usecases/complaint_uc.dart';

class ComplaintCtrl extends GetxController {
  ComplaintCtrl({required this.complaintUc});

  final ComplaintUc complaintUc;

  RxBool isLoading = false.obs;
  var currentPage = 1.obs;
  final int _page = 0;
  final int _pageSize = 0;

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

  /*///func to get list lottery participation
  Future<List<ParticipationEntities>?> dataListLotteryParticipation() async {
    List<ParticipationEntities>? myResponse;

    try {
      _setLoading(true);

      final Either<Failure, LotteryParticipationResponse> result =
      await complaintUc.executeListLotteryParticipation(_phone, _page, _pageSize);

      result.fold(
              (Failure failure) {
            AppLogger.error("fetch data failed: ${failure.message}");
          },
              (LotteryParticipationResponse response) {
            final List<ParticipationEntities> lotteryParticipationData = response.content??[];
            AppLogger.info("lotteryParticipationData successful: $lotteryParticipationData");
            myResponse = lotteryParticipationData;
          }
      );
    } catch (e) {
      AppLogger.error('An error occurred during dataListLotteryParticipation: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return myResponse;
  }*/


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

}