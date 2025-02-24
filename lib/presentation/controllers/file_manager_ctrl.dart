import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/utils/logger_util.dart';

import '../../core/services/toast_service.dart';
import '../../domain/entities/file_data_response.dart';
import '../../domain/usecases/file_manager_uc.dart';


class FileManagerCtrl extends GetxController {
  FileManagerCtrl({required this.fileManagerUc});

  final FileManagerUc fileManagerUc;

  RxBool isLoading = false.obs;
  var currentPage = 1.obs;
  static const String _persist = "MINIO";
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


  ///func to add file
  Future<FileDataResponse?> uploadFile(BuildContext context, File file) async {
    FileDataResponse? response;

    try {
      _setLoading(true);

      final Either<Failure, FileDataResponse> result = await fileManagerUc.executeSaveFile(file, _persist);

      result.fold(
              (Failure failure) {
            AppLogger.error("fetch data failed: ${failure.message}");
            ToastService.showError(context, 'Fichier', description: failure.message);
          },
              (FileDataResponse fileData) {
            AppLogger.info("fileData successful: ${fileData.toJson()}");
            ToastService.showSuccess(context, 'Fichier', description: "Fichier enregistrée !");
            response = fileData;
          });
    } catch (e) {
      AppLogger.error('An error occurred during saveFileManager: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return response;
  }


  ///func to get info file
  Future<File?> readFileInfo(String fileUrl) async {
    File? myResponse;

    try {
      _setLoading(true);

      final Either<Failure, String> result = await fileManagerUc.executeReadFile(fileUrl, _persist);

      result.fold(
              (Failure failure) {
            AppLogger.error("fetch data failed: ${failure.message}");
          },
              (String response) {
            AppLogger.info("file info data successful: $response");
            myResponse = File(response);
          }
      );
    } catch (e) {
      AppLogger.error('An error occurred during reading of file info data: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }

    return myResponse;
  }
}
