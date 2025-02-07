import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../../data/dtos/add_lottery_dto.dart';
import '../entities/lottery/lottery_data_response.dart';
import 'package:invoice_app/domain/repositories/i_lottery_repository.dart';


class LotteryUc {
  final ILotteryRepository lotteryRepository;

  LotteryUc(this.lotteryRepository);

  Future<Either<Failure, LotteryDataResponse>> executeSaveLotteryForParticipant(AddLotteryDto params) async {
    return await lotteryRepository.saveLotteryForParticipant(params);
  }

}