import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/domain/entities/auth/login_response.dart';

abstract class IAuthRepository {

  Future<Either<Failure, LoginResponse>> userLogin(String clientId,
      String username, String password, String grantType);

}
