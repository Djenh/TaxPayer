sealed class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  final int? statusCode;
  const NetworkFailure({
    required String message,
    this.statusCode
  }) : super(message);
}

class ServerFailure extends Failure {
  final String errorCode;
  const ServerFailure({
    required String message,
    required this.errorCode
  }) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class ValidationFailure extends Failure {
  final List<String> errors;
  const ValidationFailure(this.errors) : super('Validation Error');
}