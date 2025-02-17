import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_entities_list_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:retrofit/retrofit.dart';


part 'api_invoice.g.dart';

@RestApi()
abstract class ApiInvoice {
  factory ApiInvoice(Dio dio, {String baseUrl}) = _ApiInvoice;

  @GET("/typeinvoice")
  Future<HttpResponse<TypeInvoiceResponse>> getAllTypeInvoice(
      @Queries() Map<String, dynamic> pageable);

  @GET("/invoice/tin/{tin}")
  Future<HttpResponse<InvoiceEntitiesListResponse>> getAllInvoice(
      @Queries() Map<String, dynamic> pageable,@Path("tin") String tin);

  @GET("/invoice/tin/{tin}/code/{code}")
  Future<HttpResponse<InvoiceEntitiesListResponse>> getInvoiceByTinAndCode(
      @Queries() Map<String, dynamic> pageable,@Path("tin") String tin,
      @Path("code") String code);

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