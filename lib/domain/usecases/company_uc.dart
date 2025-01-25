import 'package:dartz/dartz.dart';
import 'package:invoice_app/data/dtos/add_pos_dto.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/domain/entities/company/localities_list_response.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/domain/repositories/i_company_repository.dart';

import '../../core/errors/request_failures.dart';

class CompanyUc {
  final ICompanyRepository companyRepository;

  CompanyUc(this.companyRepository);

  Future<Either<Failure, CompanyTinResponse>> companyInfoByTin(String tin) async {
    return await companyRepository.companyInfoByTin(tin);
  }

  Future<Either<Failure, List<PosDataResponse>>> executeListPosCompanyByTin(String tin) async {
    return await companyRepository.listPosCompanyByTin(tin);
  }

  Future<Either<Failure, PosDataResponse>> executePosCompanyById(String id) async {
    return await companyRepository.posCompanyById(id);
  }

  Future<Either<Failure, PosDataResponse>> executeSavePosCompany(AddPosDto params) async {
    return await companyRepository.savePosCompany(params);
  }

  Future<Either<Failure, PosDataResponse>> executeUpdPosCompanyBy(String id, AddPosDto params) async {
    return await companyRepository.updPosCompany(id, params);
  }

  Future<Either<Failure, LocalitiesListResponse>> executeAllLocalities(int page, int size) async {
    return await companyRepository.allLocalities(page, size);
  }

}