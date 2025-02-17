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

abstract class IInvoiceRepository {
  Future<Either<Failure, TypeInvoiceResponse>> allTypeInvoice(int page, int size);
  Future<Either<Failure, InvoiceEntitiesListResponse>> allInvoice(int page, int size,String tin);
  Future<Either<Failure, InvoiceEntitiesListResponse>> getAllInvoiceByTinAndCode(int page, int size,String tin,String code);
  Future<Either<Failure, DepositTaxResponse>> allDepositTax(int page, int size);
  Future<Either<Failure, InvoiceResponse>> addInvoice(AddInvoiceDto params);
  Future<Either<Failure, InvoiceResponse>> calculationInvoice(
      AddInvoiceDto params);
  Future<Either<Failure, InvoiceResponse>> invoiceByCode(String code);
  Future<Either<Failure, InvoiceResponse>> reimbursementInvoice(String action,
      ReimbursementInvoiceDto params);
  Future<Either<Failure, InvoiceResponse>> calculationReimbursement(
      ReimbursementInvoiceDto params);
  Future<Either<Failure, InvoiceCheckTinRequire>> checkTinRequire(
      TinRequireCheckDto params);
  Future<Either<Failure, InvoiceResponse>> invoiceVerify(String signature);

  Future<Either<Failure, List<ItemsEntities>>> allProductsReimbursement(
      String productCode);
}
