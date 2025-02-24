import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/lottery/lottery_data_response.dart';
import '../../../domain/entities/lottery/lottery_participation_response.dart';


part 'api_lottery.g.dart';

@RestApi()
abstract class ApiLottery {
  factory ApiLottery(Dio dio, {String baseUrl}) = _ApiLottery;


  @GET("/list/participation-by-phone")
  Future<HttpResponse<LotteryParticipationResponse>> getListLotteryParticipation(@Queries() Map<String, dynamic> params);

  @POST("/create")
  Future<HttpResponse<LotteryDataResponse>> createLotteryForParticipant(@Body() Map<String, dynamic> params);

}