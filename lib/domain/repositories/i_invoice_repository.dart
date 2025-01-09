
import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';

abstract class IInvoiceRepository {
  Future<Either<Failure, TypeInvoiceResponse>> allTypeInvoice(int page, int size);
  Future<Either<Failure, TaxGroupResponse>> allTaxGroup(int page, int size);
  Future<Either<Failure, DepositTaxResponse>> allDepositTax(int page, int size);
}
