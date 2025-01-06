import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'api_customers.g.dart';

@RestApi()
abstract class ApiCustomers {
  factory ApiCustomers(Dio dio, {String baseUrl}) = _ApiCustomers;
}