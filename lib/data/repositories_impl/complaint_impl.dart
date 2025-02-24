import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:invoice_app/core/errors/request_failures.dart';

import '../../core/errors/dio_failures.dart';
import '../../domain/entities/complaint/category_complaint_entities.dart';
import '../../domain/entities/complaint/category_complaint_response.dart';
import '../../domain/entities/complaint/complaint_data_response.dart';
import '../../domain/entities/complaint/complaint_list_response.dart';
import '../../domain/repositories/i_complaint_repository.dart';
import '../datasource/remote/api_complaint.dart';
import '../dtos/complaint/add_category_complaint_dto.dart';
import '../dtos/complaint/add_complaint_dto.dart';


class ComplaintRemoteRepository implements IComplaintRepository{
  ComplaintRemoteRepository({required this.apiComplaint});

  final ApiComplaint apiComplaint;


  @override
  Future<Either<Failure, ComplaintDataResponse>> saveComplaint(AddComplaintDto params) async {
    // TODO: implement saveComplaint
    try {
      final HttpResponse<ComplaintDataResponse> httpResponse =
      await apiComplaint.createComplaint(params.toJson());
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
  Future<Either<Failure, ComplaintListResponse>> listComplaint(int page, int size) async {
    // TODO: implement listComplaint

    final Map<String, dynamic> params = {"page": page, "size": size};
    try {
      final HttpResponse<ComplaintListResponse> httpResponse =
      await apiComplaint.getListComplaint(params);

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
  Future<Either<Failure, CategoryComplaintResponse>> allCategories(int page, int size) async {
    // TODO: implement allCategories
    try {
      final HttpResponse<CategoryComplaintResponse> httpResponse = await apiComplaint.getAllCategories(page, size);
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
  Future<Either<Failure, CategoryComplaintEntities>> createCategory(AddCategoryComplaintDto params) async {
    // TODO: implement createCategory
    try {
      final HttpResponse<CategoryComplaintEntities> httpResponse = await apiComplaint.createCategory(params.toJson());
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
