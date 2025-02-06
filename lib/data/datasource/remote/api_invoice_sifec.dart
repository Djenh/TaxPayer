import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:retrofit/retrofit.dart';


part 'api_invoice_sifec.g.dart';

@RestApi()
abstract class ApiInvoiceSifec {
  factory ApiInvoiceSifec(Dio dio, {String baseUrl}) = _ApiInvoiceSifec;

  @GET("/invoice/verify/{signature}")
  Future<HttpResponse<InvoiceResponse>> verifyInvoice(@Path("signature") String signature);
}