import 'package:get_it/get_it.dart';
import 'package:invoice_app/data/datasource/remote/api_auth.dart';
import 'package:invoice_app/data/datasource/remote/api_company.dart';
import 'package:invoice_app/data/datasource/remote/api_customers.dart';
import 'package:invoice_app/data/datasource/remote/api_invoice.dart';
import 'package:invoice_app/data/datasource/remote/api_products.dart';
import 'package:invoice_app/data/network/dio_service.dart';
import 'package:invoice_app/data/repositories_impl/auth_impl.dart';
import 'package:invoice_app/data/repositories_impl/company_impl.dart';
import 'package:invoice_app/data/repositories_impl/invoice_impl.dart';
import 'package:invoice_app/domain/usecases/auth_uc.dart';
import 'package:invoice_app/domain/usecases/company_uc.dart';
import 'package:invoice_app/domain/usecases/customer_uc.dart';
import 'package:invoice_app/domain/usecases/invoice_uc.dart';
import 'package:invoice_app/domain/usecases/product_uc.dart';
import 'package:invoice_app/presentation/controllers/auth_ctrl.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/controllers/customer_ctrl.dart';
import 'package:invoice_app/presentation/controllers/dashboard_ctrl.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';
import '../../data/repositories_impl/customers_impl.dart';
import '../../data/repositories_impl/products_impl.dart';
import 'environment_config.dart';



final GetIt locator = GetIt.instance;

void setupLocator() {

  //Save config env
  locator.registerLazySingleton(() => EnvironmentConfig());

  //Services


  //Repositories

  ///Auth--- Repositories
  final ApiAuth apiAuth = AppDioService.getApiAuth();
  locator.registerLazySingleton(() => AuthRemoteRepository(apiAuth: apiAuth));
  locator.registerLazySingleton(() => AuthUc(locator<AuthRemoteRepository>()));

  ///Invoice--- Repositories
  final ApiInvoice apiInvoice = AppDioService.getApiInvoice();
  locator.registerLazySingleton(() => InvoiceRemoteRepository(apiInvoice: apiInvoice));
  locator.registerLazySingleton(() => InvoiceUc(locator<InvoiceRemoteRepository>()));

  ///Company--- Repositories
  final ApiCompany apiCompany = AppDioService.getApiCompany();
  locator.registerLazySingleton(() => CompanyRemoteRepository(apiCompany: apiCompany));
  locator.registerLazySingleton(() => CompanyUc(locator<CompanyRemoteRepository>()));

  ///Customer--- Repositories
  final ApiCustomers apiCustomers = AppDioService.getApiCustomer();
  locator.registerLazySingleton(() => CustomerRemoteRepository(apiCustomers: apiCustomers));
  locator.registerLazySingleton(() => CustomerUc(locator<CustomerRemoteRepository>()));

  ///Product--- Repositories
  final ApiProducts apiProducts = AppDioService.getApiProduct();
  locator.registerLazySingleton(() => ProductRemoteRepository(apiProducts: apiProducts));
  locator.registerLazySingleton(() => ProductUc(locator<ProductRemoteRepository>()));


  //Ctrl globaux
  locator.registerLazySingleton(() => InvoiceCtrl(invoiceUc: locator<InvoiceUc>()));
  locator.registerLazySingleton(() => DashboardCtrl());
  locator.registerLazySingleton(() => CompanyCtrl(companyUc: locator<CompanyUc>()));

  //Ctrl spécifiques à certaines pages
  locator.registerFactory(() => AuthCtrl(authUc: locator<AuthUc>()));
  locator.registerFactory(() => CustomerCtrl(customerUc: locator<CustomerUc>()));
  locator.registerFactory(() => ProductCtrl(productUc: locator<ProductUc>()));


}