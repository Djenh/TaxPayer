import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/domain/repositories/i_invoice_repository.dart';


class InvoiceUc {
  final IInvoiceRepository invoiceRepository;

  InvoiceUc(this.invoiceRepository);

  Future<Either<Failure, TypeInvoiceResponse>> executeAllTypeInvoice(int page, int size) async {
    return await invoiceRepository.allTypeInvoice(page, size);
  }

  Future<Either<Failure, TaxGroupResponse>> executeAllTaxGroup(int page, int size) async {
    return await invoiceRepository.allTaxGroup(page, size);
  }

  Future<Either<Failure, DepositTaxResponse>> executeAllDepositTax(int page, int size) async {
    return await invoiceRepository.allDepositTax(page, size);
  }

}