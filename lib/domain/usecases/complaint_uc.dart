import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../../data/dtos/add_complaint_dto.dart';
import '../entities/complaint/complaint_data_response.dart';
import '../repositories/i_complaint_repository.dart';


class ComplaintUc {
  final IComplaintRepository complaintRepository;

  ComplaintUc(this.complaintRepository);

  /*Future<Either<Failure, LotteryParticipationResponse>> executeListLotteryParticipation(String phone, int page, int size) async {
    return await complaintRepository.listLotteryParticipation(phone, page, size);
  }*/

  Future<Either<Failure, ComplaintDataResponse>> executeSaveComplaint(AddComplaintDto params) async {
    return await complaintRepository.saveComplaint(params);
  }

}