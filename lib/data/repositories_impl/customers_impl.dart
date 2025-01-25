import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/data/datasource/remote/api_customers.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_customer_dto.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';
import 'package:invoice_app/domain/repositories/i_customer_repository.dart';
import 'package:retrofit/dio.dart';
import 'package:invoice_app/core/errors/request_failures.dart';


import '../../core/errors/dio_failures.dart';


class CustomerRemoteRepository implements ICustomerRepository{
  CustomerRemoteRepository({required this.apiCustomers});

  final ApiCustomers apiCustomers;

  @override
  Future<Either<Failure, CustomerListResponse>> allCustomerListByTin(String tin, int page, int size)  async {
    // TODO: implement allCustomerListByTin
    try {
      final HttpResponse<CustomerListResponse> httpResponse = await apiCustomers.getAllCustomerByTin(tin, page, size);
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
  Future<Either<Failure, CustomerEntities>> customerByCode(String code) async {
    // TODO: implement customerByCode
    try {
      final HttpResponse<CustomerEntities> httpResponse = await apiCustomers.getCustomerByCode(code);
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
  Future<Either<Failure, CustomerEntities>> customerByTinCode(String tin, String code) async {
    // TODO: implement customerByTinCode
    try {
      final HttpResponse<CustomerEntities> httpResponse = await apiCustomers.getCustomerByTinCode(tin, code);
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
  Future<Either<Failure, CustomerEntities>> saveCustomer(AddCustomerDto cus) async {
    // TODO: implement saveCustomer
    try {
      final HttpResponse<CustomerEntities> httpResponse =
          await apiCustomers.createCustomer(cus.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
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
  Future<Either<Failure, CustomerEntities>> updCustomer(String id, AddCustomerDto params) async {
    // TODO: implement updCustomer
    try {
      final HttpResponse<CustomerEntities> httpResponse =
          await apiCustomers.updatedCustomer(id, params.toJson());

      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
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
  Future<Either<Failure, CategoriesListResponse>> allCategories(int page, int size) async {
    // TODO: implement allCategories
    try {
      final HttpResponse<CategoriesListResponse> httpResponse =
          await apiCustomers.getCategoryForCustomer(page, size);
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
  Future<Either<Failure, CategoriesEntities>> createCategory(AddCategoryDto params) async {
    // TODO: implement createCategory
    try {
      final HttpResponse<CategoriesEntities> httpResponse =
          await apiCustomers.setCategoryCustomer(params.toJson());
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