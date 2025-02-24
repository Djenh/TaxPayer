import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../entities/file_data_response.dart';


abstract class IFileManagerRepository {

  Future<Either<Failure, FileDataResponse>> saveFileManager(File file, String persist);
  Future<Either<Failure, String>> readFileManager(String fileUrl, String persist);
}
