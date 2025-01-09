import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:retrofit/retrofit.dart';


part 'api_invoice.g.dart';

@RestApi()
abstract class ApiInvoice {
  factory ApiInvoice(Dio dio, {String baseUrl}) = _ApiInvoice;

  @GET("/typeinvoice")
  Future<HttpResponse<TypeInvoiceResponse>> getAllTypeInvoice(@Queries() Map<String, dynamic> pageable);


  @GET("/tax-groups")
  Future<HttpResponse<TaxGroupResponse>> getAllTaxGroup(@Queries() Map<String, dynamic> pageable);


  @GET("/deposittax")
  Future<HttpResponse<DepositTaxResponse>> getAllDepositTax(@Queries() Map<String, dynamic> pageable);


}