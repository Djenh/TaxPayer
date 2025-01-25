import 'package:dartz/dartz.dart';
import 'package:invoice_app/data/dtos/add_pos_dto.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/domain/entities/company/localities_list_response.dart';

import '../../core/errors/request_failures.dart';
import '../entities/company/pos_data_response.dart';


abstract class ICompanyRepository {
  Future<Either<Failure, CompanyTinResponse>> companyInfoByTin(String tin);
  Future<Either<Failure, List<PosDataResponse>>> listPosCompanyByTin(String tin);
  Future<Either<Failure, PosDataResponse>> posCompanyById(String id);
  Future<Either<Failure, PosDataResponse>> savePosCompany(AddPosDto params);
  Future<Either<Failure, PosDataResponse>> updPosCompany(String id, AddPosDto params);
  Future<Either<Failure, LocalitiesListResponse>> allLocalities(int page, int size);
}
