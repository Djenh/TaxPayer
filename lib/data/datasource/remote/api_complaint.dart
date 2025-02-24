import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/complaint/category_complaint_entities.dart';
import '../../../domain/entities/complaint/category_complaint_response.dart';
import '../../../domain/entities/complaint/complaint_data_response.dart';
import '../../../domain/entities/complaint/complaint_list_response.dart';


part 'api_complaint.g.dart';

@RestApi()
abstract class ApiComplaint {
  factory ApiComplaint(Dio dio, {String baseUrl}) = _ApiComplaint;


  @POST("/complaints")
  Future<HttpResponse<ComplaintDataResponse>> createComplaint(
      @Body() Map<String, dynamic> params);

  @GET("/complaints")
  Future<HttpResponse<ComplaintListResponse>> getListComplaint(@Queries() Map<String, dynamic> params);

  @POST("/categories")
  Future<HttpResponse<CategoryComplaintEntities>> createCategory(
      @Body() Map<String, dynamic> params);

  @GET("/categories")
  Future<HttpResponse<CategoryComplaintResponse>> getAllCategories(
      @Query("page") int page, @Query("size") int size);

}