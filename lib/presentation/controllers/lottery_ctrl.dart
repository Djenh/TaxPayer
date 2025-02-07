import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/domain/entities/company/localities_list_response.dart';
import 'package:invoice_app/utils/logger_util.dart';

import '../../core/services/toast_service.dart';
import '../../data/dtos/add_lottery_dto.dart';
import '../../domain/entities/lottery/lottery_response.dart';
import '../../domain/usecases/lottery_uc.dart';

class LotteryCtrl extends GetxController {
  LotteryCtrl({required this.lotteryUc});

  final LotteryUc lotteryUc;

  RxBool isLoading = false.obs;
  static const _pageSize = 20;
  var currentPage = 1.obs;
  PagingController<int, LocalitiesEntities>? pagingLocController;


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


  ///func to add pos for company
  Future<LotteryDataResponse?> addPosForCompany(BuildContext context, AddLotteryDto params) async {
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