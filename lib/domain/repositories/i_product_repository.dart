import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_product_dto.dart';
import 'package:invoice_app/data/dtos/add_unit_dto.dart';
import 'package:invoice_app/data/dtos/pricing_dto.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';
import 'package:invoice_app/domain/entities/product/product_response.dart';
import 'package:invoice_app/domain/entities/product/unit_m_list_response.dart';


abstract class IProductRepository {
  Future<Either<Failure, UnitMEntities>> createUnitM(AddUnitDto params);
  Future<Either<Failure, UnitMEntities>> updatedUnitM(String id, AddUnitDto params);
  Future<Either<Failure, UnitMListResponse>> allListUnitM(int page, int size);
  Future<Either<Failure, CategoriesEntities>> createCategory(AddCategoryDto params);
  Future<Either<Failure, CategoriesListResponse>> allCategories(int page, int size);
  Future<Either<Failure, ProductResponse>> createProduct(AddProductDto params);
  Future<Either<Failure, ProductResponse>> mProduct(String uuid, AddProductDto params);
  Future<Either<Failure, ProductResponse>> productById(String uuid);
  Future<Either<Failure, ProductListResponse>> allProduct(int page, int size);
  Future<Either<Failure, ProductListResponse>> allProductsByTin(String tin, int page, int size);
  Future<Either<Failure, TaxGroupResponse>> allTaxGroup(int page, int size);
  Future<Either<Failure, PricingListResponse>> pricingProductByCode(String code,
      int page, int size);
  Future<Either<Failure, PricingResponse>> setPricing(PricingDto params);

}
