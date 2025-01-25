
import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/dtos/add_invoice_dto.dart';
import 'package:invoice_app/data/dtos/pricing_dto.dart';
import 'package:invoice_app/data/dtos/reimbursement_invoice_dto.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/invoice/pricing_response.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';

abstract class IInvoiceRepository {
  Future<Either<Failure, TypeInvoiceResponse>> allTypeInvoice(int page, int size);
  Future<Either<Failure, TaxGroupResponse>> allTaxGroup(int page, int size);
  Future<Either<Failure, DepositTaxResponse>> allDepositTax(int page, int size);
  Future<Either<Failure, PricingResponse>> setPricing(PricingDto params);
  Future<Either<Failure, PricingListResponse>> pricingProductByCode(String code,
      int page, int size);
  Future<Either<Failure, InvoiceResponse>> addInvoice(AddInvoiceDto params);
  Future<Either<Failure, InvoiceResponse>> calculationInvoice(
      AddInvoiceDto params);
  Future<Either<Failure, InvoiceResponse>> invoiceByCode(String code);
  Future<Either<Failure, InvoiceResponse>> reimbursementInvoice(String action,
      ReimbursementInvoiceDto params);
  Future<Either<Failure, InvoiceResponse>> calculationReimbursement(
      ReimbursementInvoiceDto params);
  Future<Either<Failure, InvoiceResponse>> invoiceVerify(String signature);
}
