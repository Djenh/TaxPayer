import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/data/dtos/add_pos_dto.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/domain/usecases/company_uc.dart';
import 'package:invoice_app/utils/logger_util.dart';

import '../../core/services/toast_service.dart';

class CompanyCtrl extends GetxController {
  CompanyCtrl({required this.companyUc});

  final CompanyUc companyUc;


  RxBool isLoading = false.obs;

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




  /// Fonction pour hacher un email
  String hashEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final username = parts[0];
    final domain = parts[1];
    final hiddenUsername = username.length > 2
        ? "${username.substring(0, 2)}***"
        : "${username.substring(0, 1)}***";
    return "$hiddenUsername@$domain";
  }

  /// Fonction pour hacher un numéro de téléphone
  String hashPhone(String phone) {
    if (phone.length < 4) return phone;

    final visibleStart = phone.substring(0, 2);
    final visibleEnd = phone.substring(phone.length - 2);
    return "$visibleStart *** $visibleEnd";
  }


  ///func to get info company by tin
  Future<CompanyTinResponse?> dataCompanyByTin(BuildContext context, String tin) async {
    CompanyTinResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, CompanyTinResponse> result = await companyUc.companyInfoByTin(tin);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
        ToastService.showError(context, 'Vérification', description: failure.message);
      }, (CompanyTinResponse companyData) {
        if (companyData.tin == tin) {
          AppLogger.info("dataCompanyByTin successful: ${companyData.toJson()}");
          response = companyData;
        }
      });
    } catch (e) {
      AppLogger.error('An error occurred during dataCompanyByTin: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get list pos company by Tin
  Future<List<PosDataResponse>?> dataListPosCompanyByTin() async {
    List<PosDataResponse>? response;
    String? tin = AppServices.instance.currentCompany.value?.tin;

    try {
      _setLoading(true);

      final Either<Failure, List<PosDataResponse>> result =
               await companyUc.executeListPosCompanyByTin(tin!);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
      }, (List<PosDataResponse> companyDataPos) {
        if (companyDataPos.first.companyTin == tin) {
          AppLogger.info("companyDataPos successful: $companyDataPos");
          response = companyDataPos;
        }
      });
    } catch (e) {
      AppLogger.error('An error occurred during dataListPosCompanyByTin: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to get data pos company by idPos
  Future<PosDataResponse?> dataPosCompanyById(String id) async {
    PosDataResponse? response;
    String? tin = AppServices.instance.currentCompany.value?.tin;


    try {
      _setLoading(true);

      final Either<Failure, PosDataResponse> result =
      await companyUc.executePosCompanyById(id);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
      }, (PosDataResponse companyDataPos) {
        if (companyDataPos.companyTin == tin) {
          AppLogger.info("companyDataPos successful: $companyDataPos");
          response = companyDataPos;
        }
      });
    } catch (e) {
      AppLogger.error('An error occurred during dataPosCompanyById: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to add pos for company
  Future<PosDataResponse?> addPosForCompany(BuildContext context, AddPosDto params) async {
    PosDataResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, PosDataResponse> result = await companyUc.executeSavePosCompany(params);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
        ToastService.showError(context, 'Point de vente', description: failure.message);
      }, (PosDataResponse posData) {
        AppLogger.info("posData successful: ${posData.toJson()}");
        ToastService.showSuccess(context, 'Point de vente', description: "Point de vente enregistrer avec succès !");
        response = posData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during addPosForCompany: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

  ///func to update pos for company
  Future<PosDataResponse?> updatePosForCompany(BuildContext context, String id, AddPosDto params) async {
    PosDataResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, PosDataResponse> result = await companyUc.executeUpdPosCompanyBy(id, params);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
        ToastService.showError(context, 'Point de vente', description: failure.message);
      }, (PosDataResponse posData) {
        AppLogger.info("posData successful: ${posData.toJson()}");
        ToastService.showSuccess(context, 'Point de vente', description: "Point de vente modifier avec succès !");
        response = posData;
      });
    } catch (e) {
      AppLogger.error('An error occurred during updatePosForCompany: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }

}