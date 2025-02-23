import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../../data/dtos/add_complaint_dto.dart';
import '../entities/complaint/complaint_data_response.dart';


abstract class IComplaintRepository {

  // Future<Either<Failure, LotteryParticipationResponse>> listLotteryParticipation(String phone, int page, int size);
  Future<Either<Failure, ComplaintDataResponse>> saveComplaint(AddComplaintDto params);

}
