import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/errors/dio_failures.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/datasource/remote/api_invoice_sifec.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/repositories/i_invoice_sifec_repository.dart';
import 'package:retrofit/retrofit.dart';


class InvoiceSifecRemoteRepository implements IInvoiceSifecRepository {
  InvoiceSifecRemoteRepository({required this.apiInvoiceSifec});

  final ApiInvoiceSifec apiInvoiceSifec;


  @override
  Future<Either<Failure, InvoiceResponse>> invoiceVerify(
      String signature) async {
    // TODO: implement invoiceVerify
    try {
      final HttpResponse<InvoiceResponse> httpResponse =
      await apiInvoiceSifec.verifyInvoice(signature);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(
        NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

}
