import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'api_invoice.g.dart';

@RestApi()
abstract class ApiInvoice {
  factory ApiInvoice(Dio dio, {String baseUrl}) = _ApiInvoice;
}