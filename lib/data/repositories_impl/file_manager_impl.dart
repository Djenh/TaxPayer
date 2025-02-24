import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:invoice_app/core/errors/request_failures.dart';

import '../../core/errors/dio_failures.dart';
import '../../domain/entities/file_data_response.dart';
import '../../domain/repositories/i_file_manager_repository.dart';
import '../datasource/remote/api_file_manager.dart';


class FileManagerRemoteRepository implements IFileManagerRepository{
  FileManagerRemoteRepository({required this.apiFileManager});

  final ApiFileManager apiFileManager;


  @override
  Future<Either<Failure, FileDataResponse>> saveFileManager(File file, String persist) async {
    // TODO: implement saveFileManager
    try {
      final HttpResponse<FileDataResponse> httpResponse = await apiFileManager.createFile(file, persist);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }


  @override
  Future<Either<Failure, String>> readFileManager(String fileUrl, String persist) async {
    // TODO: implement listFileManager

    final Map<String, dynamic> params = {"url": fileUrl, "persist": persist};
    try {
      final HttpResponse<String> httpResponse = await apiFileManager.getFileData(params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }
}
