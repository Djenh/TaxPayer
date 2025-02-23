import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/complaint/complaint_data_response.dart';


part 'api_complaint.g.dart';

@RestApi()
abstract class ApiComplaint {
  factory ApiComplaint(Dio dio, {String baseUrl}) = _ApiComplaint;


  /*@GET("/stack/invoice/list/participation-by-phone")
  Future<HttpResponse<LotteryParticipationResponse>> getListLotteryParticipation(@Queries() Map<String, dynamic> params);
*/

  @POST("/sifec-complaints-ms/complaints")
  Future<HttpResponse<ComplaintDataResponse>> createComplaint(@Body() Map<String, dynamic> params);

}