import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../../data/dtos/complaint/add_category_complaint_dto.dart';
import '../../data/dtos/complaint/add_complaint_dto.dart';
import '../entities/complaint/category_complaint_entities.dart';
import '../entities/complaint/category_complaint_response.dart';
import '../entities/complaint/complaint_data_response.dart';
import '../entities/complaint/complaint_list_response.dart';
import '../repositories/i_complaint_repository.dart';


class ComplaintUc {
  final IComplaintRepository complaintRepository;

  ComplaintUc(this.complaintRepository);

  Future<Either<Failure, ComplaintDataResponse>> executeSaveComplaint(AddComplaintDto params) async {
    return await complaintRepository.saveComplaint(params);
  }

  Future<Either<Failure, ComplaintListResponse>> executeListComplaint(int page, int size) async {
    return await complaintRepository.listComplaint(page, size);
  }

  Future<Either<Failure, CategoryComplaintEntities>> executeCategorySave(AddCategoryComplaintDto params) async {
    return await complaintRepository.createCategory(params);
  }

  Future<Either<Failure, CategoryComplaintResponse>> executeAllCategory(int page, int size) async {
    return await complaintRepository.allCategories(page, size);
  }

}