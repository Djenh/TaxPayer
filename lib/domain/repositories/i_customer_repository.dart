import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_customer_dto.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';


abstract class ICustomerRepository {
  Future<Either<Failure, CustomerEntities>> saveCustomer(AddCustomerDto cus);
  Future<Either<Failure, CustomerEntities>> updCustomer(String id, AddCustomerDto params);
  Future<Either<Failure, CustomerListResponse>> allCustomerListByTin(String tin,
      int page, int size);
  Future<Either<Failure, CustomerEntities>> customerByTinCode(String tin, String code);
  Future<Either<Failure, CustomerEntities>> customerByCode(String code);
  Future<Either<Failure, CategoriesEntities>> createCategory(AddCategoryDto params);
  Future<Either<Failure, CategoriesListResponse>> allCategories(int page, int size);
}
