import 'package:dio/dio.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_list_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/product/product_response.dart';


part 'api_products.g.dart';

@RestApi()
abstract class ApiProducts {
  factory ApiProducts(Dio dio, {String baseUrl}) = _ApiProducts;

  @POST("/categories")
  Future<HttpResponse<CategoriesEntities>> createCategory(@Body() Map<String, dynamic> params);

  @GET("/categories")
  Future<HttpResponse<CategoriesListResponse>> getAllCategories(@Query("page") int page, @Query("size") int size);

  @POST("/products")
  Future<HttpResponse<ProductResponse>> createProduct(@Body() Map<String, dynamic> params);

  @GET("/products")
  Future<HttpResponse<ProductListResponse>> getAllProducts(@Query("page") int page, @Query("size") int size);

  @GET("/products/company/{tin}")
  Future<HttpResponse<ProductListResponse>> getAllProductsByTin(@Path("tin") String tin,
      @Queries() Map<String, dynamic> pageable);


}