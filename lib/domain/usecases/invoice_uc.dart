import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/dtos/add_invoice_dto.dart';
import 'package:invoice_app/data/dtos/reimbursement_invoice_dto.dart';
import 'package:invoice_app/data/dtos/tin_require_check.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_entities_list_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/invoice/tin_require_check.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/domain/repositories/i_invoice_repository.dart';


class InvoiceUc {
  final IInvoiceRepository invoiceRepository;

  InvoiceUc(this.invoiceRepository);

  Future<Either<Failure, TypeInvoiceResponse>> executeAllTypeInvoice(
      int page, int size) async {
    return await invoiceRepository.allTypeInvoice(page, size);
  }

  Future<Either<Failure, InvoiceEntitiesListResponse>> executeAllInvoice(
      String tin,int page, int size) async {
    return await invoiceRepository.allInvoice(page, size,tin);
  }
  Future<Either<Failure, InvoiceEntitiesListResponse>> executeAllInvoiceByTinAndCode(
      String tin,String code,int page, int size) async {
    return await invoiceRepository.getAllInvoiceByTinAndCode(page, size,tin,code);
  }

  Future<Either<Failure, DepositTaxResponse>> executeAllDepositTax(
      int page, int size) async {
    return await invoiceRepository.allDepositTax(page, size);
  }

  Future<Either<Failure, InvoiceResponse>> executeAddInvoice(
      AddInvoiceDto params) async {
    return await invoiceRepository.addInvoice(params);
  }

  Future<Either<Failure, InvoiceResponse>> executeCalculationInvoice(
      AddInvoiceDto params) async {
    return await invoiceRepository.calculationInvoice(params);
  }

  Future<Either<Failure, InvoiceResponse>> executeInvoiceByCode(
      String code) async {
    return await invoiceRepository.invoiceByCode(code);
  }

  Future<Either<Failure, InvoiceResponse>> executeReimbursementInvoice(
      String action, ReimbursementInvoiceDto params) async {
    return await invoiceRepository.reimbursementInvoice(action, params);
  }

  Future<Either<Failure, InvoiceResponse>> executeCalculationReimbursement(
      ReimbursementInvoiceDto params) async {
    return await invoiceRepository.calculationReimbursement(params);
  }
  Future<Either<Failure, InvoiceCheckTinRequire>> executeCheckTinRequire(
      TinRequireCheckDto params) async {
    return await invoiceRepository.checkTinRequire(params);
  }

  Future<Either<Failure, InvoiceResponse>> executeInvoiceVerify(
      String signature) async {
    return await invoiceRepository.invoiceVerify(signature);
  }


  Future<Either<Failure, List<ItemsEntities>>> allProductsReimbursement(
      String productCode) async {
    return await invoiceRepository.allProductsReimbursement(productCode);
  }

}