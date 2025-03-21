import 'dart:async';
import 'dart:collection';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:invoice_app/data/datasource/remote/api_invoice_sifec.dart';
import 'package:invoice_app/utils/network_util.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../core/configs/environment_config.dart';
import '../../core/configs/injection_container.dart';
import '../../core/services/app_service.dart';
import '../datasource/remote/api_auth.dart';
import '../datasource/remote/api_company.dart';
import '../datasource/remote/api_complaint.dart';
import '../datasource/remote/api_customers.dart';
import '../datasource/remote/api_file_manager.dart';
import '../datasource/remote/api_invoice.dart';
import '../datasource/remote/api_lottery.dart';
import '../datasource/remote/api_products.dart';


class AppDioService {
  static const String tag = 'WebService-sifec';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;

  DioException? dioError;

  //late final Dio _tokenDio = Dio();
  static AppDioService? appDioService;
  static ApiAuth? apiAuth;
  static ApiInvoice? apiInvoice;
  static ApiInvoiceSifec? apiInvoiceSifec;
  static ApiCompany? apiCompany;
  static ApiProducts? apiProducts;
  static ApiCustomers? apiCustomers;
  static ApiLottery? apiLottery;
  static ApiComplaint? apiComplaint;
  static ApiFileManager? apiFileManager;

  // Retry configuration
  static const int maxRetries = 3;
  static const int retryDelay = 1000;

  static final Queue<RetryItem> _retryQueue = Queue<RetryItem>();
  static bool _isRetrying = false;

  static Dio dio = Dio(BaseOptions(
    baseUrl: locator<EnvironmentConfig>().baseUrlApi,
    headers: <String, dynamic>{
      'Accept': 'application/json',
      //'Content-Type': 'application/json',
      'Cache-Control': 'no-cache',
    },
    connectTimeout: const Duration(milliseconds: connectTimeout),
    receiveTimeout: const Duration(milliseconds: receiveTimeout),
    sendTimeout: const Duration(milliseconds: sendTimeout),
  ));


  // Cache configuration
  final Map<String, CacheItem> _cache = <String, CacheItem>{};
  static const Duration cacheDuration = Duration(minutes: 5);

  //instance module api
  static AppDioService getInstance() {
    appDioService ??= AppDioService._();
    return appDioService!;
  }

  static ApiAuth getApiAuth() {
    if (apiAuth == null) {
      AppDioService.getInstance();
      apiAuth = ApiAuth(dio, baseUrl: locator<EnvironmentConfig>().keycloakUrl);
    }
    return apiAuth!;
  }

  static ApiInvoice getApiInvoice() {
    if (apiInvoice == null) {
      AppDioService.getInstance();
      apiInvoice = ApiInvoice(dio, baseUrl: locator<EnvironmentConfig>().baseUrlInvoices);
    }
    return apiInvoice!;
  }
  static ApiInvoiceSifec getApiInvoiceSifec() {
    if (apiInvoiceSifec == null) {
      AppDioService.getInstance();
      apiInvoiceSifec = ApiInvoiceSifec(dio, baseUrl: locator<EnvironmentConfig>().baseUrlInvoicesSifec);
    }
    return apiInvoiceSifec!;
  }

  static ApiCompany getApiCompany() {
    if (apiCompany == null) {
      AppDioService.getInstance();
      apiCompany = ApiCompany(dio, baseUrl: locator<EnvironmentConfig>().baseUrlCompany);
    }
    return apiCompany!;
  }

  static ApiProducts getApiProduct() {
    if (apiProducts == null) {
      AppDioService.getInstance();
      apiProducts = ApiProducts(dio, baseUrl: locator<EnvironmentConfig>().baseUrlProducts);
    }
    return apiProducts!;
  }

  static ApiCustomers getApiCustomer() {
    if (apiCustomers == null) {
      AppDioService.getInstance();
      apiCustomers = ApiCustomers(dio, baseUrl: locator<EnvironmentConfig>().baseUrlCustomers);
    }
    return apiCustomers!;
  }

  static ApiLottery getApiLottery() {
    if (apiLottery == null) {
      AppDioService.getInstance();
      apiLottery = ApiLottery(dio, baseUrl: locator<EnvironmentConfig>().baseUrlLottery);
    }
    return apiLottery!;
  }

  static ApiComplaint getApiComplaint() {
    if (apiComplaint == null) {
      AppDioService.getInstance();
      apiComplaint = ApiComplaint(dio, baseUrl: locator<EnvironmentConfig>().baseUrlComplaint);
    }
    return apiComplaint!;
  }

  static ApiFileManager getApiFileManager() {
    if (apiFileManager == null) {
      AppDioService.getInstance();
      apiFileManager = ApiFileManager(dio, baseUrl: locator<EnvironmentConfig>().baseUrlFileManager);
    }
    return apiFileManager!;
  }




  AppDioService._() {
    _initializeService();
  }

  void _initializeService() {
    addInterceptor();
    _setupRetryMechanism();
    _setupCacheSystem();
    _setupConnectivityListener();
  }

  // Connectivity monitoring
  void _setupConnectivityListener() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty && results.last != ConnectivityResult.none) {
        _processRetryQueue().catchError((error) {
          debugPrint('Error processing retry queue: $error');
        });
      }
    });
  }

  // Cache system implementation
  void _setupCacheSystem() {
    Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      _cleanExpiredCache();
    });
  }

  void _cleanExpiredCache() {
    final DateTime now = DateTime.now();
    _cache.removeWhere(
        (String key, CacheItem value) => now.isAfter(value.expiryTime));
  }


  // Retry mechanism implementation
  void _setupRetryMechanism() {
    Timer.periodic(const Duration(milliseconds: retryDelay), (Timer timer) {
      if (!_isRetrying) {
        _processRetryQueue();
      }
    });
  }

  Future<void> _processRetryQueue() async {
    if (_retryQueue.isEmpty || _isRetrying) return;

    _isRetrying = true;
    try {
      final RetryItem retryItem = _retryQueue.removeFirst();
      if (retryItem.retryCount < maxRetries) {
        await _retry(retryItem.options);
      }
    } finally {
      _isRetrying = false;
    }
  }

  // Interceptor func
  void addInterceptor() {
    dio.interceptors.clear();

    if (kDebugMode) {
      //talker dioLogger
      dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
          ),
        ),
      );
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {

        final List<ConnectivityResult> connectivityResult =
            await Connectivity().checkConnectivity();
        if (connectivityResult.first == ConnectivityResult.none) {
          return handler.reject(
            DioException(
              requestOptions: options,
              error: 'Pas de connexion Internet.',
              type: DioExceptionType.connectionError,
            ),
          );
        }


        if (options.path.contains("/token")) {
          options.headers["Content-Type"] = "application/x-www-form-urlencoded";
        } else {
          options.headers["Content-Type"] = "application/json";
        }


        // final String? authToken = AppServices.instance.authTokenUser;
        final String? authToken = "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJCVWxOa0xya1ZyNWZsYXpuTDZjNW9YTnhSdDRRUHpNTDhuc1VPeEJxd2pnIn0.eyJleHAiOjE3NDAwNzg1NDAsImlhdCI6MTc0MDA0MjU0MCwianRpIjoiY2RiMWJlZDYtYzk4My00ODFmLWE4MmMtYWRlMWFiZTI4Y2IxIiwiaXNzIjoiaHR0cHM6Ly9rZXljbG9hay5ieXRlaW5ub3YuY29tL3JlYWxtcy9TSUZFQy1DT1JFIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6IjQzOGEzNzBkLTI0MDktNDc5NC05NzJjLTQ3ZWE4YzY4MTY5ZiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImxvdHRlcnkiLCJzZXNzaW9uX3N0YXRlIjoiNmQxNmVhMmQtNTFmMS00ZDhmLTk0ZWItNWQ0NTA1MTg4OTkwIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyIvKiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsiZGVmYXVsdC1yb2xlcy1zaWZlYyIsIkNPUkVfT0ZGSUNFUiIsIkNPUkVfTE9URVJZX01BTkFHRVIiLCJDT1JFX09GRklDRVJfTUFOQUdFUiIsIkNPUkVfREVWRUxPUEVSIiwiQ09SRV9MT1RFUllfT0ZGSUNFUiIsIkNPUkVfQ0VOVEVSX01BTkFHRVIiLCJvZmZsaW5lX2FjY2VzcyIsIkNPUkVfR0VORVJBTF9TVVBFUlZJU09SIiwiQ09SRV9BRE1JTiIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsInZpZXctYXBwbGljYXRpb25zIiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiI2ZDE2ZWEyZC01MWYxLTRkOGYtOTRlYi01ZDQ1MDUxODg5OTAiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmFtZSI6IkNJMDEyMzQ1NjcwMSBDSTAxMjM0NTY3MDEiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJjaTAxMjM0NTY3MDEiLCJnaXZlbl9uYW1lIjoiQ0kwMTIzNDU2NzAxIiwiZmFtaWx5X25hbWUiOiJDSTAxMjM0NTY3MDEiLCJlbWFpbCI6ImNpMDEyMzQ1NjcwMUBieXRlaW5ub3YuY29tIn0.I1iw7yYAm1Phm3iow59o5C5yGgFl_KUeUAa4mQgK83aKjZxkLigkbjAU8aLFC-b1QWNaskH3rR7DMMrVC4WASDtLz44KGc47w0_1wtBywjTCrt_CcRyB0fQTAgfsmjMvrsNm57NI0OxFMPkboQ4AGcdaE95ixa1ndKpWHepb6MueaG3MhqDHrBClijbcdXyEpxET8RFXQKVZVWqgmDrgdTjNdOV1VjltEh8mktVimx-Hs-CE9rs2hE8hcwZeLHqtEtKuvmnoF7BHWY9zPQ_X76LMVdNxCzpUuYpn3_x6XL6WAkg9d38ZI36od400O7WbuUPVMjQS4BWLEkQ4lJI8bg";


        if (authToken != null && authToken.isNotEmpty) {
          options.headers['Authorization'] = "Bearer $authToken";
          debugPrint("Requesting with token: $authToken");
        }

        // Timestamp pour éviter le cache du navigateur
        if (options.method == 'GET') {
          options.queryParameters['_timestamp'] =
              DateTime.now().millisecondsSinceEpoch;
        }

        return handler.next(options);
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler handler) async {
        if (response.data == null) {
          return handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              error: 'Réponse vide',
              type: DioExceptionType.badResponse,
            ),
          );
        }

        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) async {
        debugPrint("Error interceptor webservice: ${e.response}");

        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            if (!_retryQueue.any((RetryItem item) =>
                item.options.path == e.requestOptions.path)) {
              _retryQueue.add(RetryItem(e.requestOptions, 0));
            }
            break;

          case DioExceptionType.badResponse:
            if (e.response?.statusCode == 401 &&
                !e.requestOptions.extra.containsKey('retry')) {
              return await _handleUnauthorizedError(e, handler);
            }
            break;

          default:
            //other error
            break;
        }

        return handler.next(e);
      },
    ));
  }

  Future<dynamic> _handleUnauthorizedError(DioException e,
      ErrorInterceptorHandler handler) async {
    /*try {
        e.requestOptions.headers["Authorization"] = "Bearer ${AppServices.instance.authTokenUser}";
        e.requestOptions.extra['retry'] = true;
        final response = await _retry(e.requestOptions);
        return handler.resolve(response);
      } catch (error) {
        return handler.next(e);
      }*/
    return handler.next(e);
  }


  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
        extra: requestOptions.extra,
      ),
    );
  }
}
