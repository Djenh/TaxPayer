import 'package:dartz/dartz.dart';

import '../../core/errors/request_failures.dart';
import '../../data/dtos/complaint/add_category_complaint_dto.dart';
import '../../data/dtos/complaint/add_complaint_dto.dart';
import '../entities/complaint/category_complaint_entities.dart';
import '../entities/complaint/category_complaint_response.dart';
import '../entities/complaint/complaint_data_response.dart';
import '../entities/complaint/complaint_list_response.dart';


abstract class IComplaintRepository {

  Future<Either<Failure, ComplaintDataResponse>> saveComplaint(AddComplaintDto params);
  Future<Either<Failure, ComplaintListResponse>> listComplaint(int page, int size);
  Future<Either<Failure, CategoryComplaintEntities>> createCategory(AddCategoryComplaintDto params);
  Future<Either<Failure, CategoryComplaintResponse>> allCategories(int page, int size);

}
