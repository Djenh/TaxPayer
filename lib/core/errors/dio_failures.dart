import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/errors/request_failures.dart';

class DioErrorHandler {
  /// Gère les exceptions Dio en fonction de leur type
  static Either<Failure, T> handle<T>({
    required DioException error,
    T Function(dynamic data)? successHandler,
  }) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Left(NetworkFailure(
          message: error.message ?? 'Délai de connexion dépassé',
          statusCode: error.response?.statusCode,
        ));

      case DioExceptionType.receiveTimeout:
        return Left(NetworkFailure(
          message: error.message ?? 'Délai de réception dépassé',
          statusCode: error.response?.statusCode,
        ));

      case DioExceptionType.sendTimeout:
        return Left(NetworkFailure(
          message: error.message ?? 'Délai d\'envoi dépassé',
          statusCode: error.response?.statusCode,
        ));

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return Left(NetworkFailure(
          message: error.message ?? 'Requête annulée',
          statusCode: error.response?.statusCode,
        ));

      case DioExceptionType.connectionError:
        return Left(NetworkFailure(
          message: error.message ?? 'Erreur de connexion réseau',
          statusCode: error.response?.statusCode,
        ));

      case DioExceptionType.badCertificate:
        return Left(NetworkFailure(
          message: error.message ?? 'Erreur de certificat SSL',
          statusCode: error.response?.statusCode,
        ));

      case DioExceptionType.unknown:
        return Left(NetworkFailure(
          message: error.message ?? 'Erreur réseau inconnue',
          statusCode: error.response?.statusCode,
        ));
    }
  }

  /// Gère les erreurs HTTP spécifiques comme 404, 500, etc.
  static Either<Failure, T> _handleBadResponse<T>(DioException error) {
    final Response<dynamic>? response = error.response;
    final int? statusCode = response?.statusCode;

    // Formater le message d'erreur à partir de la réponse
    String errorMessage = response?.data["message"] ?? 'Erreur lors du traitement. Statut: $statusCode';

    if (response?.data != null && response?.data is Map) {
      final String? object = response?.data["object"];
      final String? value = response?.data["value"];
      final String? property = response?.data["property"];

      if (object != null && value != null && property != null) {
        errorMessage = "$errorMessage (Objet : $object, Propriété : $property, Valeur : $value)";
      }
    }

    switch (statusCode) {
      case 400:
        return Left(ServerFailure(message: errorMessage, errorCode: 'BAD_REQUEST'));
      case 401:
        return Left(ServerFailure(message: errorMessage, errorCode: 'UNAUTHORIZED'));
      case 403:
        return Left(ServerFailure(message: errorMessage, errorCode: 'FORBIDDEN'));
      case 404:
        return Left(ServerFailure(message: errorMessage, errorCode: 'NOT_FOUND'));
      case 409:
        return Left(ServerFailure(message: errorMessage, errorCode: 'CONFLICT'));
      case 500:
        return Left(ServerFailure(message: errorMessage, errorCode: 'INTERNAL_SERVER_ERROR'));
      default:
        return Left(NetworkFailure(message: errorMessage, statusCode: statusCode));
    }
  }

  /// Gère les réponses non exceptionnelles avec un statut d'erreur
  static Either<Failure, T> handleError<T>(Response response) {
    final int? statusCode = response.statusCode;
    final dynamic data = response.data;

    String errorMessage = data["message"] ?? "Erreur lors du traitement. Statut: $statusCode";

    if (data != null && data is Map) {
      final String? object = data["object"];
      final String? value = data["value"];
      final String? property = data["property"];

      if (object != null && value != null && property != null) {
        errorMessage = "$errorMessage (Objet : $object, Propriété : $property, Valeur : $value)";
      }
    }

    final errors = data["error"];
    if (errors != null) {
      if (errors is Map) {
        final List<String> errorMessages = [];
        errors.forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((msg) => msg.toString()));
          } else if (value is String) {
            errorMessages.add(value);
          }
        });
        if (errorMessages.isNotEmpty) {
          errorMessage = errorMessages.join('\n');
        }
      } else if (errors is String) {
        errorMessage = errors;
      }
    }

    return Left(NetworkFailure(message: errorMessage, statusCode: statusCode));
  }
}
