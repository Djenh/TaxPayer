import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../entities/file_data_response.dart';
import '../repositories/i_file_manager_repository.dart';


class FileManagerUc {
  final IFileManagerRepository fileManagerRepository;

  FileManagerUc(this.fileManagerRepository);

  Future<Either<Failure, FileDataResponse>> executeSaveFile(File file, String persist) async {
    return await fileManagerRepository.saveFileManager(file, persist);
  }

  Future<Either<Failure, String>> executeReadFile(String fileUrl, String persist) async {
    return await fileManagerRepository.readFileManager(fileUrl, persist);
  }

}