import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/errors/dio_failures.dart';
import 'package:invoice_app/data/dtos/add_unit_dto.dart';
import 'package:invoice_app/data/dtos/pricing_dto.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/domain/entities/product/unit_m_list_response.dart';
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
      if (httpResponse.response.statusCode == HttpStatus.ok
          || httpResponse.response.statusCode == HttpStatus.created) {
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
  Future<Either<Failure, UnitMListResponse>> allListUnitM(int page, int size) async {
    // TODO: implement allListUnitM
    try {
      final HttpResponse<UnitMListResponse> httpResponse =
           await apiProducts.getAllUnitM(page, size);
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
  Future<Either<Failure, UnitMEntities>> createUnitM(AddUnitDto params) async {
    // TODO: implement createUnitM
    try {
      final HttpResponse<UnitMEntities> httpResponse =
               await apiProducts.createUnitM(params.toJson());
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
  Future<Either<Failure, UnitMEntities>> updatedUnitM(String id, AddUnitDto params) async {
    // TODO: implement updatedUnitM
    try {
      final HttpResponse<UnitMEntities> httpResponse =
          await apiProducts.updatedUnitM(id, params.toJson());
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
  Future<Either<Failure, TaxGroupResponse>> allTaxGroup(
      int page, int size) async {
    // TODO: implement allTaxGroup
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<TaxGroupResponse> httpResponse =
      await apiProducts.getAllTaxGroup(pageable);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(
        NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, PricingListResponse>> pricingProductByCode(
      String code, int page, int size) async {
    // TODO: implement pricingProductByCode
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<PricingListResponse> httpResponse =
      await apiProducts.getPricingProductByCode(code, pageable);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(
        NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, PricingResponse>> setPricing(PricingDto params) async {
    // TODO: implement setPricing
    try {
      final HttpResponse<PricingResponse> httpResponse =
      await apiProducts.setPricing(params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(
        NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, ProductResponse>> mProduct(String uuid, AddProductDto params) async {
    // TODO: implement mProduct
    try {
      final HttpResponse<ProductResponse> httpResponse = await apiProducts.updProduct(uuid, params.toJson());
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
  Future<Either<Failure, ProductResponse>> productById(String uuid) async {
    // TODO: implement productById
    try {
      final HttpResponse<ProductResponse> httpResponse = await apiProducts.getProductById(uuid);
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