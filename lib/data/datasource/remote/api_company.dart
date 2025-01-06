import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:retrofit/retrofit.dart';


part 'api_company.g.dart';

@RestApi()
abstract class ApiCompany {
  factory ApiCompany(Dio dio, {String baseUrl}) = _ApiCompany;

  @GET("/companies/tin/{tin}")
  Future<HttpResponse<CompanyTinResponse>> getCompanyByTin(@Path("tin") String tin);

  @GET("/pos/tin/{tin}")
  Future<HttpResponse<List<PosDataResponse>>> getListPosCompanyByTin(@Path("tin") String tin);

  @GET("/pos/{id}")
  Future<HttpResponse<PosDataResponse>> getPosCompanyById(@Path("id") String id);

  @POST("/pos")
  Future<HttpResponse<PosDataResponse>> createPosForCompany(@Body() Map<String, dynamic> params);

  @PUT("/pos/{id}")
  Future<HttpResponse<PosDataResponse>> updatePosForCompany(@Path("id") String id, @Body() Map<String, dynamic> params);


}