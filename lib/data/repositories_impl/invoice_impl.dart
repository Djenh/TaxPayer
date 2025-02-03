import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/core/errors/dio_failures.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/data/datasource/remote/api_invoice.dart';
import 'package:invoice_app/data/dtos/add_invoice_dto.dart';
import 'package:invoice_app/data/dtos/reimbursement_invoice_dto.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_entities_list_response.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:invoice_app/domain/repositories/i_invoice_repository.dart';
import 'package:retrofit/retrofit.dart';


class InvoiceRemoteRepository implements IInvoiceRepository {
  InvoiceRemoteRepository({required this.apiInvoice});

  final ApiInvoice apiInvoice;

  @override
  Future<Either<Failure, DepositTaxResponse>> allDepositTax(
      int page, int size) async {
    // TODO: implement allDepositTax
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<DepositTaxResponse> httpResponse =
          await apiInvoice.getAllDepositTax(pageable);
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



  @override
  Future<Either<Failure, TypeInvoiceResponse>> allTypeInvoice(
      int page, int size) async {
    // TODO: implement allTypeInvoice
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<TypeInvoiceResponse> httpResponse =
          await apiInvoice.getAllTypeInvoice(pageable);
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


  @override
  Future<Either<Failure, InvoiceEntitiesListResponse>> allInvoice(String tin,
      int page, int size) async {
    // TODO: implement allTypeInvoice
    final Map<String, dynamic> pageable = {"page": page, "size": size};

    try {
      final HttpResponse<InvoiceEntitiesListResponse> httpResponse =
          await apiInvoice.getAllInvoice(pageable,tin);
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

  @override
  Future<Either<Failure, InvoiceResponse>> addInvoice(
      AddInvoiceDto params) async {
    // TODO: implement addInvoice
    try {
      final HttpResponse<InvoiceResponse> httpResponse =
          await apiInvoice.createInvoice(params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
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

  @override
  Future<Either<Failure, InvoiceResponse>> calculationInvoice(
      AddInvoiceDto params) async {
    // TODO: implement calculationInvoice
    try {
      final HttpResponse<InvoiceResponse> httpResponse =
          await apiInvoice.calculationInvoice(params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
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

  @override
  Future<Either<Failure, InvoiceResponse>> calculationReimbursement(
      ReimbursementInvoiceDto params) async {
    // TODO: implement calculationReimbursement
    try {
      final HttpResponse<InvoiceResponse> httpResponse =
          await apiInvoice.calculationReimbursementInvoice(params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
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

  @override
  Future<Either<Failure, InvoiceResponse>> invoiceByCode(String code) async {
    // TODO: implement invoiceByCode
    try {
      final HttpResponse<InvoiceResponse> httpResponse =
          await apiInvoice.getInvoiceByCode(code);
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

  @override
  Future<Either<Failure, InvoiceResponse>> invoiceVerify(
      String signature) async {
    // TODO: implement invoiceVerify
    try {
      final HttpResponse<InvoiceResponse> httpResponse =
          await apiInvoice.verifyInvoice(signature);
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

  @override
  Future<Either<Failure, InvoiceResponse>> reimbursementInvoice(
      String action, ReimbursementInvoiceDto params) async {
    // TODO: implement reimbursementInvoice
    try {
      final HttpResponse<InvoiceResponse> httpResponse =
          await apiInvoice.reimbursementInvoice(action, params.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
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
