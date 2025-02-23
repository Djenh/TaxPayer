import 'package:get_it/get_it.dart';
import 'package:invoice_app/data/datasource/remote/api_auth.dart';
import 'package:invoice_app/data/datasource/remote/api_company.dart';
import 'package:invoice_app/data/datasource/remote/api_customers.dart';
import 'package:invoice_app/data/datasource/remote/api_invoice.dart';
import 'package:invoice_app/data/datasource/remote/api_invoice_sifec.dart';
import 'package:invoice_app/data/datasource/remote/api_products.dart';
import 'package:invoice_app/data/network/dio_service.dart';
import 'package:invoice_app/data/repositories_impl/auth_impl.dart';
import 'package:invoice_app/data/repositories_impl/company_impl.dart';
import 'package:invoice_app/data/repositories_impl/invoice_impl.dart';
import 'package:invoice_app/data/repositories_impl/invoice_sifec_impl.dart';
import 'package:invoice_app/domain/usecases/auth_uc.dart';
import 'package:invoice_app/domain/usecases/company_uc.dart';
import 'package:invoice_app/domain/usecases/customer_uc.dart';
import 'package:invoice_app/domain/usecases/invoice_sifec_uc.dart';
import 'package:invoice_app/domain/usecases/invoice_uc.dart';
import 'package:invoice_app/domain/usecases/product_uc.dart';
import 'package:invoice_app/presentation/controllers/auth_ctrl.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/controllers/customer_ctrl.dart';
import 'package:invoice_app/presentation/controllers/dashboard_ctrl.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/controllers/invoice_sifec_ctrl.dart';
import 'package:invoice_app/presentation/controllers/product_ctrl.dart';
import '../../data/datasource/remote/api_complaint.dart';
import '../../data/datasource/remote/api_lottery.dart';
import '../../data/repositories_impl/complaint_impl.dart';
import '../../data/repositories_impl/customers_impl.dart';
import '../../data/repositories_impl/lottery_impl.dart';
import '../../data/repositories_impl/products_impl.dart';
import '../../domain/usecases/complaint_uc.dart';
import '../../domain/usecases/lottery_uc.dart';
import '../../presentation/controllers/complaint_ctrl.dart';
import '../../presentation/controllers/lottery_ctrl.dart';
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
  final ApiInvoiceSifec apiInvoiceSifec = AppDioService.getApiInvoiceSifec();
  locator.registerLazySingleton(() => InvoiceRemoteRepository(apiInvoice: apiInvoice));
  locator.registerLazySingleton(() => InvoiceSifecRemoteRepository(apiInvoiceSifec: apiInvoiceSifec));
  locator.registerLazySingleton(() => InvoiceUc(locator<InvoiceRemoteRepository>()));
  locator.registerLazySingleton(() => InvoiceSifeUc(locator<InvoiceSifecRemoteRepository>()));

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
  locator.registerLazySingleton(() => InvoiceSifecCtrl(invoiceSifeUc: locator<InvoiceSifeUc>()));
  locator.registerLazySingleton(() => DashboardCtrl());
  locator.registerLazySingleton(() => CompanyCtrl(companyUc: locator<CompanyUc>()));

  //Ctrl spécifiques à certaines pages
  locator.registerFactory(() => AuthCtrl(authUc: locator<AuthUc>()));
  locator.registerFactory(() => CustomerCtrl(customerUc: locator<CustomerUc>()));
  locator.registerFactory(() => ProductCtrl(productUc: locator<ProductUc>()));

  ///Lottery--- Repositories
  final ApiLottery apiLottery = AppDioService.getApiLottery();
  locator.registerLazySingleton(() => LotteryRemoteRepository(apiLottery: apiLottery));
  locator.registerLazySingleton(() => LotteryUc(locator<LotteryRemoteRepository>()));
  locator.registerLazySingleton(() => LotteryCtrl(lotteryUc: locator<LotteryUc>()));

  ///Complaint--- Repositories
  final ApiComplaint apiComplaint = AppDioService.getApiComplaint();
  locator.registerLazySingleton(() => ComplaintRemoteRepository(apiComplaint: apiComplaint));
  locator.registerLazySingleton(() => ComplaintUc(locator<ComplaintRemoteRepository>()));
  locator.registerLazySingleton(() => ComplaintCtrl(complaintUc: locator<ComplaintUc>()));

}