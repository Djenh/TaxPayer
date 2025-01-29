import 'package:dartz/dartz.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_product_dto.dart';
import 'package:invoice_app/data/dtos/add_unit_dto.dart';
import 'package:invoice_app/data/dtos/pricing_dto.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/domain/entities/product/unit_m_list_response.dart';
import 'package:invoice_app/domain/repositories/i_product_repository.dart';

import '../../core/errors/request_failures.dart';
import '../entities/product/categories_entities.dart';
import '../entities/product/categories_list_response.dart';
import '../entities/product/product_response.dart';


class ProductUc {
  final IProductRepository productRepository;

  ProductUc(this.productRepository);

  Future<Either<Failure, UnitMEntities>> executeUnitMSave(AddUnitDto params) async {
    return await productRepository.createUnitM(params);
  }

  Future<Either<Failure, UnitMEntities>> executeUnitMUpdate(String id, AddUnitDto params) async {
    return await productRepository.updatedUnitM(id, params);
  }

  Future<Either<Failure, UnitMListResponse>> executeAllUnitM(int page, int size) async {
    return await productRepository.allListUnitM(page, size);
  }

  Future<Either<Failure, CategoriesEntities>> executeCategorySave(AddCategoryDto params) async {
    return await productRepository.createCategory(params);
  }

  Future<Either<Failure, ProductResponse>> executeProductSave(AddProductDto params) async {
    return await productRepository.createProduct(params);
  }

  Future<Either<Failure, CategoriesListResponse>> executeAllCategory(int page, int size) async {
    return await productRepository.allCategories(page, size);
  }

  Future<Either<Failure, ProductListResponse>> executeAllProduct(int page, int size) async {
    return await productRepository.allProduct(page, size);
  }

  Future<Either<Failure, ProductListResponse>> executeAllProductByTin(String tin, int page, int size) async {
    return await productRepository.allProductsByTin(tin, page, size);
  }

  Future<Either<Failure, TaxGroupResponse>> executeAllTaxGroup(
      int page, int size) async {
    return await productRepository.allTaxGroup(page, size);
  }

  Future<Either<Failure, PricingListResponse>> executePricingProductByCode(
      String code, int page, int size) async {
    return await productRepository.pricingProductByCode(code, page, size);
  }

  Future<Either<Failure, PricingResponse>> executeSetPricing(
      PricingDto params) async {
    return await productRepository.setPricing(params);
  }

}