import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/domain/entities/auth/login_response.dart';

import '../repositories/i_auth_repository.dart';

class AuthUc {
  final IAuthRepository authRepository;

  AuthUc(this.authRepository);


  Future<Either<Failure, LoginResponse>> executeAuthUser(String clientId,
      String username, String password, String grantType) async {
    return await authRepository.userLogin(clientId, username, password,
        grantType);
  }

}