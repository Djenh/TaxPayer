import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:retrofit/retrofit.dart';


part 'api_invoice.g.dart';

@RestApi()
abstract class ApiInvoice {
  factory ApiInvoice(Dio dio, {String baseUrl}) = _ApiInvoice;

  @GET("/typeinvoice")
  Future<HttpResponse<TypeInvoiceResponse>> getAllTypeInvoice(
      @Queries() Map<String, dynamic> pageable);

  @GET("/invoice")
  Future<HttpResponse<InvoiceEntitiesResponse>> getAllInvoice(
      @Queries() Map<String, dynamic> pageable,String tin);


  @GET("/security-tax")
  Future<HttpResponse<DepositTaxResponse>> getAllDepositTax(
      @Queries() Map<String, dynamic> pageable);


  @POST("/invoice")
  Future<HttpResponse<InvoiceResponse>> createInvoice(
      @Body() Map<String, dynamic> params);

  @POST("/invoice/calculation")
  Future<HttpResponse<InvoiceResponse>> calculationInvoice(
      @Body() Map<String, dynamic> params);

  @GET("/invoice/code/{code}")
  Future<HttpResponse<InvoiceResponse>> getInvoiceByCode(@Path("code") String code);

  @POST("/invoice/reimbursement")
  Future<HttpResponse<InvoiceResponse>> reimbursementInvoice(
      @Path("action") String action, @Body() Map<String, dynamic> params);

  @POST("/invoice/reimbursement/calculation")
  Future<HttpResponse<InvoiceResponse>> calculationReimbursementInvoice(
      @Body() Map<String, dynamic> params);

  @GET("/invoice/verify/{signature}")
  Future<HttpResponse<InvoiceResponse>> verifyInvoice(@Path("signature") String signature);
}