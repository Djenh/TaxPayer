import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:invoice_app/core/enums/env_enum.dart';

class EnvironmentConfig {
  static final EnvironmentConfig _instance = EnvironmentConfig._internal();
  factory EnvironmentConfig() => _instance;
  EnvironmentConfig._internal();

  static Environment currentEnvironment = Environment.dev;

  String get baseUrl => _getEnvValue('BASE_URL');
  String get baseUrlApi => _getEnvValue('BASE_URL_API');

  String get clientId => _getEnvValue('CLIENT_ID');
  String get keycloakUrl => _getEnvValue('URL_KEYCLOAK');

  String get baseUrlCompany => _getEnvValue('URL_COMPANY');
  String get baseUrlCustomers => _getEnvValue('URL_CUSTOMERS');
  String get baseUrlProducts => _getEnvValue('URL_PRODUCTS');
  String get baseUrlInvoices => _getEnvValue('URL_INVOICES');
  String get baseUrlInvoicesSifec => _getEnvValue('URL_INVOICES_SIFEC');
  String get baseUrlLottery => _getEnvValue('URL_LOTTERIES');
  String get baseUrlComplaint => _getEnvValue('URL_COMPLAINTS');
  String get baseUrlFileManager => _getEnvValue('URL_FILE_MANAGER');


  String _getEnvValue(String key) {
    switch (currentEnvironment) {
      case Environment.dev:
        return dotenv.get(key);
      case Environment.prod:
        //return dotenv.get('${key}_PROD');
        return dotenv.get(key);
    }
  }

  static void setEnvironment(Environment env) {
    currentEnvironment = env;
  }
}