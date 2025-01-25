import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';
import 'package:retrofit/retrofit.dart';


part 'api_customers.g.dart';

@RestApi()
abstract class ApiCustomers {
  factory ApiCustomers(Dio dio, {String baseUrl}) = _ApiCustomers;

  @POST("/clients")
  Future<HttpResponse<CustomerEntities>> createCustomer(@Body() Map<String, dynamic> params);

  @PUT("/clients/{id}")
  Future<HttpResponse<CustomerEntities>> updatedCustomer(@Path("id") String id,
      @Body() Map<String, dynamic> params);

  @GET("/clients/clients/by-owner/{owner}")
  Future<HttpResponse<CustomerListResponse>> getAllCustomerByTin(@Path("owner") String owner,
      @Query("page") int page, @Query("size") int size);

  @GET("/clients/owner/{tin}/client-code/{code}")
  Future<HttpResponse<CustomerEntities>> getCustomerByTinCode(@Path("tin") String tin,
      @Path("code") String code);

  @GET("/clients/code/{code}")
  Future<HttpResponse<CustomerEntities>> getCustomerByCode(@Path("code") String code);

  @POST("/categories")
  Future<HttpResponse<CategoriesEntities>> setCategoryCustomer(
      @Body() Map<String, dynamic> params);

  @GET("/categories")
  Future<HttpResponse<CategoriesListResponse>> getCategoryForCustomer(
      @Query("page") int page, @Query("size") int size);

}