import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/lottery/lottery_data_response.dart';


part 'api_lottery.g.dart';

@RestApi()
abstract class ApiLottery {
  factory ApiLottery(Dio dio, {String baseUrl}) = _ApiLottery;


  @POST("/stack/invoice/create")
  Future<HttpResponse<LotteryDataResponse>> createLotteryForParticipant(@Body() Map<String, dynamic> params);

}