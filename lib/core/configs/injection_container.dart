import 'package:get_it/get_it.dart';
import 'package:invoice_app/data/datasource/remote/api_auth.dart';
import 'package:invoice_app/data/network/dio_service.dart';
import 'package:invoice_app/data/repositories_impl/auth_impl.dart';
import 'package:invoice_app/domain/usecases/auth_uc.dart';
import 'package:invoice_app/presentation/controllers/auth_ctrl.dart';
import 'environment_config.dart';



final GetIt locator = GetIt.instance;

void setupLocator() {

  //Save config env
  locator.registerLazySingleton(() => EnvironmentConfig());

  //Services


  //Repositories

  ///Auth---Repositories
  final ApiAuth apiAuth = AppDioService.getApiAuth();
  locator.registerLazySingleton(() => AuthRemoteRepository(apiAuth: apiAuth));
  locator.registerLazySingleton(() => AuthUc(locator<AuthRemoteRepository>()));



  //Ctrl globaux


  //Ctrl spécifiques à certaines pages
  locator.registerFactory(() => AuthCtrl(authUc: locator<AuthUc>()));


}