import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/auth/login_response.dart';
import 'package:retrofit/retrofit.dart';


part 'api_auth.g.dart';

@RestApi()
abstract class ApiAuth {
  factory ApiAuth(Dio dio, {String baseUrl}) = _ApiAuth;

  @POST("/realms/BES-SAAS/protocol/openid-connect/token")
  Future<HttpResponse<LoginResponse>> authUser(
      @Field("client_id") String clientId,
      @Field("username") String username,
      @Field("password") String password,
      @Field("grant_type") String grantType);

}