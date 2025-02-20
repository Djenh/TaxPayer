import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/utils/logger_util.dart';

import '../../core/services/toast_service.dart';
import '../../data/dtos/add_lottery_dto.dart';
import '../../domain/entities/lottery/lottery_data_response.dart';
import '../../domain/entities/lottery/lottery_participation_response.dart';
import '../../domain/usecases/lottery_uc.dart';

class LotteryCtrl extends GetxController {
  LotteryCtrl({required this.lotteryUc});

  final LotteryUc lotteryUc;

  RxBool isLoading = false.obs;
  var currentPage = 1.obs;
  final String _phone = "0195020365";
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

  ///func to get list lottery participation
  Future<List<ParticipationEntities>?> dataListLotteryParticipation() async {
    List<ParticipationEntities>? myResponse;

    try {
      _setLoading(true);

      final Either<Failure, LotteryParticipationResponse> result =
            await lotteryUc.executeListLotteryParticipation(_phone, _page, _pageSize);

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
  }


  ///func to add lottery for participant
  Future<LotteryDataResponse?> addLotteryForParticipant(BuildContext context, AddLotteryDto params) async {
    LotteryDataResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, LotteryDataResponse> result = await lotteryUc.executeSaveLotteryForParticipant(params);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
        ToastService.showError(context, 'Tombola', description: failure.message);
      }, (LotteryDataResponse lotteryData) {
        AppLogger.info("lotteryData successful: ${lotteryData.toJson()}");
        ToastService.showSuccess(context, 'Tombola', description: "Participation enregistrée au tombola !");
        response = lotteryData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during saveLotteryForParticipant: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

}