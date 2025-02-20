import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../../data/dtos/add_lottery_dto.dart';
import '../entities/lottery/lottery_data_response.dart';
import '../entities/lottery/lottery_participation_response.dart';


abstract class ILotteryRepository {

  Future<Either<Failure, LotteryParticipationResponse>> listLotteryParticipation(String phone, int page, int size);
  Future<Either<Failure, LotteryDataResponse>> saveLotteryForParticipant(AddLotteryDto params);

}
