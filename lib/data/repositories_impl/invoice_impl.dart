import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/errors/dio_failures.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/datasource/remote/api_invoice.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/domain/repositories/i_invoice_repository.dart';
import 'package:retrofit/retrofit.dart';


class InvoiceRemoteRepository implements IInvoiceRepository{
  InvoiceRemoteRepository({required this.apiInvoice});

  final ApiInvoice apiInvoice;

  @override
  Future<Either<Failure, DepositTaxResponse>> allDepositTax(int page, int size) async {
    // TODO: implement allDepositTax
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<DepositTaxResponse> httpResponse = await apiInvoice.getAllDepositTax(pageable);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, TaxGroupResponse>> allTaxGroup(int page, int size) async {
    // TODO: implement allTaxGroup
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<TaxGroupResponse> httpResponse = await apiInvoice.getAllTaxGroup(pageable);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

  @override
  Future<Either<Failure, TypeInvoiceResponse>> allTypeInvoice(int page, int size) async {
    // TODO: implement allTypeInvoice
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<TypeInvoiceResponse> httpResponse = await apiInvoice.getAllTypeInvoice(pageable);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      }
    } on DioException catch (e) {
      return DioErrorHandler.handle(error: e);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
    return const Left(NetworkFailure(message: 'Une erreur inattendue s\'est produite.'));
  }

}