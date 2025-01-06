import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/errors/dio_failures.dart';
import 'package:retrofit/dio.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/datasource/remote/api_products.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_product_dto.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';
import 'package:invoice_app/domain/repositories/i_product_repository.dart';

class ProductRemoteRepository implements IProductRepository{
  ProductRemoteRepository({required this.apiProducts});

  final ApiProducts apiProducts;

  @override
  Future<Either<Failure, CategoriesListResponse>> allCategories(int page, int size) async {
    // TODO: implement allCategories
    try {
      final HttpResponse<CategoriesListResponse> httpResponse = await apiProducts.getAllCategories(page, size);
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
  Future<Either<Failure, ProductListResponse>> allProduct(int page, int size) async {
    // TODO: implement allProduct
    try {
      final HttpResponse<ProductListResponse> httpResponse = await apiProducts.getAllProducts(page, size);
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
  Future<Either<Failure, ProductListResponse>> allProductsByTin(String tin, int page, int size) async {
    // TODO: implement allProductsByTin
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<ProductListResponse> httpResponse = await apiProducts.getAllProductsByTin(tin, pageable);
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
      final HttpResponse<CategoriesEntities> httpResponse = await apiProducts.createCategory(params.toJson());
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
  Future<Either<Failure, ProductResponse>> createProduct(AddProductDto params) async {
    // TODO: implement createProduct
    try {
      final HttpResponse<ProductResponse> httpResponse = await apiProducts.createProduct(params.toJson());
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