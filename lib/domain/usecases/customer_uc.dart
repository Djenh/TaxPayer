import 'package:invoice_app/domain/repositories/i_customer_repository.dart';

class CustomerUc {
  final ICustomerRepository customerRepository;

  CustomerUc(this.customerRepository);
}