import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';

abstract class IInvoiceSifecRepository {
  Future<Either<Failure, InvoiceResponse>> invoiceVerify(String signature);
}
