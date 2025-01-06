import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_product_dto.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';


abstract class IProductRepository {
  Future<Either<Failure, CategoriesEntities>> createCategory(AddCategoryDto params);
  Future<Either<Failure, CategoriesListResponse>> allCategories(int page, int size);
  Future<Either<Failure, ProductResponse>> createProduct(AddProductDto params);
  Future<Either<Failure, ProductListResponse>> allProduct(int page, int size);
  Future<Either<Failure, ProductListResponse>> allProductsByTin(String tin, int page, int size);

}
