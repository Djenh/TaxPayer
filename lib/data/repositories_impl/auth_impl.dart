import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/errors/dio_failures.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/datasource/remote/api_auth.dart';
import 'package:invoice_app/data/dtos/login_dto.dart';
import 'package:invoice_app/domain/entities/auth/login_response.dart';
import 'package:retrofit/retrofit.dart';


import '../../domain/repositories/i_auth_repository.dart';


class AuthRemoteRepository implements IAuthRepository{
  AuthRemoteRepository({required this.apiAuth});

  final ApiAuth apiAuth;


  @override
  Future<Either<Failure, LoginResponse>> userLogin(String clientId,
      String username, String password, String grantType,) async {
    // TODO: implement userLogin
    try {
      final HttpResponse<LoginResponse> httpResponse = await apiAuth.authUser(
          clientId, username, password, grantType);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

}
