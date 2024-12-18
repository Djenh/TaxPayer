import 'package:invoice_app/data/datasource/remote/api_invoice.dart';
import 'package:invoice_app/domain/repositories/i_invoice_repository.dart';


class InvoiceRemoteRepository implements IInvoiceRepository{
  InvoiceRemoteRepository({required this.apiInvoice});

  final ApiInvoice apiInvoice;

}