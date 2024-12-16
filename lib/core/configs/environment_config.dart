import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:invoice_app/core/enums/env_enum.dart';

class EnvironmentConfig {
  static final EnvironmentConfig _instance = EnvironmentConfig._internal();
  factory EnvironmentConfig() => _instance;
  EnvironmentConfig._internal();

  static Environment currentEnvironment = Environment.dev;

  String get baseUrl => _getEnvValue('BASE_URL');
  String get baseUrlApi => _getEnvValue('BASE_URL_API');

  String _getEnvValue(String key) {
    switch (currentEnvironment) {
      case Environment.dev:
        return dotenv.get(key);
      case Environment.prod:
        return dotenv.get('${key}_PROD');
    }
  }

  static void setEnvironment(Environment env) {
    currentEnvironment = env;
  }
}