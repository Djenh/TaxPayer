import 'package:invoice_app/data/datasource/remote/api_auth.dart';


import '../../domain/repositories/i_auth_repository.dart';




class AuthRemoteRepository implements IAuthRepository{
  AuthRemoteRepository({required this.apiAuth});

  final ApiAuth apiAuth;

  /*@override
  Future<Either<Failure, LoginResponse>> login(LoginDto params) async {
    // TODO: implement login
    try {
      final HttpResponse<LoginResponse> httpResponse = await apiAuth.userLogin(params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return DioErrorHandler.handleError<LoginResponse>(httpResponse.response);
      }

    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }
*/

}
