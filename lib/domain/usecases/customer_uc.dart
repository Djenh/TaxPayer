import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/dtos/add_category_dto.dart';
import 'package:invoice_app/data/dtos/add_customer_dto.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';
import 'package:invoice_app/domain/repositories/i_customer_repository.dart';

class CustomerUc {
  final ICustomerRepository customerRepository;

  CustomerUc(this.customerRepository);

  Future<Either<Failure, CustomerEntities>> executeSaveCustomer(AddCustomerDto params) async {
    return await customerRepository.saveCustomer(params);
  }

  Future<Either<Failure, CustomerEntities>> executeUpdCustomer(String id, AddCustomerDto params) async {
    return await customerRepository.updCustomer(id, params);
  }

  Future<Either<Failure, CustomerListResponse>> executeListCustomerByTin(String tin, int page, int size) async {
    return await customerRepository.allCustomerListByTin(tin, page, size);
  }

  Future<Either<Failure, CustomerEntities>> executeCustomerByTinCode(String tin, String code) async {
    return await customerRepository.customerByTinCode(tin, code);
  }

  Future<Either<Failure, CustomerEntities>> executeCustomerByCode(String code) async {
    return await customerRepository.customerByCode(code);
  }

  Future<Either<Failure, CategoriesEntities>> executeCategorySave(AddCategoryDto params) async {
    return await customerRepository.createCategory(params);
  }

  Future<Either<Failure, CategoriesListResponse>> executeAllCategory(int page, int size) async {
    return await customerRepository.allCategories(page, size);
  }



}