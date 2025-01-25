import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/data/dtos/add_pos_dto.dart';
import 'package:invoice_app/domain/entities/company/localities_list_response.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:retrofit/dio.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/datasource/remote/api_company.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/domain/repositories/i_company_repository.dart';

import '../../core/errors/dio_failures.dart';


class CompanyRemoteRepository implements ICompanyRepository{
  CompanyRemoteRepository({required this.apiCompany});

  final ApiCompany apiCompany;

  @override
  Future<Either<Failure, CompanyTinResponse>> companyInfoByTin(String tin) async {
    try {
      final HttpResponse<CompanyTinResponse> httpResponse = await apiCompany.getCompanyByTin(tin);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, List<PosDataResponse>>> listPosCompanyByTin(String tin) async {
    // TODO: implement listPosCompanyByTin
    try {
      final HttpResponse<List<PosDataResponse>> httpResponse = await apiCompany.getListPosCompanyByTin(tin);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, PosDataResponse>> posCompanyById(String id) async {
    // TODO: implement posCompanyById
    try {
      final HttpResponse<PosDataResponse> httpResponse = await apiCompany.getPosCompanyById(id);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, PosDataResponse>> savePosCompany(AddPosDto params) async {
    // TODO: implement savePosCompany
    try {
      final HttpResponse<PosDataResponse> httpResponse = await apiCompany.createPosForCompany(params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, PosDataResponse>> updPosCompany(String id, AddPosDto params) async {
    // TODO: implement updPosCompany
    try {
      final HttpResponse<PosDataResponse> httpResponse = await apiCompany.updatePosForCompany(id, params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, LocalitiesListResponse>> allLocalities(int page, int size) async {
    // TODO: implement allLocalities
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<LocalitiesListResponse> httpResponse = await apiCompany.getAllLocalities(pageable);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }



}