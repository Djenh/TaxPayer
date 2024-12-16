import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'api_auth.g.dart';

@RestApi()
abstract class ApiAuth {
  factory ApiAuth(Dio dio, {String baseUrl}) = _ApiAuth;
}