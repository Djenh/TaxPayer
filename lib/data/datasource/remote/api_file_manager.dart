import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/file_data_response.dart';



part 'api_file_manager.g.dart';

@RestApi()
abstract class ApiFileManager {
  factory ApiFileManager(Dio dio, {String baseUrl}) = _ApiFileManager;


  @GET("/read")
  Future<HttpResponse<String>> getFileData(@Queries() Map<String, dynamic> params);

  @POST("/upload")
  @MultiPart()
  Future<HttpResponse<FileDataResponse>> createFile(@Part() File file, @Part() String persist);

}