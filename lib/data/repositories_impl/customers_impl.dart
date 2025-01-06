import 'package:invoice_app/data/datasource/remote/api_customers.dart';
import 'package:invoice_app/domain/repositories/i_customer_repository.dart';

class CustomerRemoteRepository implements ICustomerRepository{
  CustomerRemoteRepository({required this.apiCustomers});

  final ApiCustomers apiCustomers;

}