import 'package:invoice_app/domain/repositories/i_invoice_repository.dart';


class InvoiceUc {
  final IInvoiceRepository invoiceRepository;

  InvoiceUc(this.invoiceRepository);
}