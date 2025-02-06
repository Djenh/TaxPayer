import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/repositories/i_invoice_sifec_repository.dart';


class InvoiceSifeUc {
  final IInvoiceSifecRepository invoiceSifecRepository;

  InvoiceSifeUc(this.invoiceSifecRepository);

  Future<Either<Failure, InvoiceResponse>> executeInvoiceVerify(
      String signature) async {
    return await invoiceSifecRepository.invoiceVerify(signature);
  }

}