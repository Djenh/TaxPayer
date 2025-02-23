import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_app/data/dtos/add_lottery_dto.dart';
import 'package:invoice_app/domain/entities/lottery/lottery_data_response.dart';
import 'package:retrofit/dio.dart';
import 'package:invoice_app/core/errors/request_failures.dart';

import '../../core/errors/dio_failures.dart';
import '../../domain/entities/complaint/complaint_data_response.dart';
import '../../domain/entities/lottery/lottery_participation_response.dart';
import '../../domain/repositories/i_complaint_repository.dart';
import '../../domain/repositories/i_lottery_repository.dart';
import '../datasource/remote/api_complaint.dart';
import '../datasource/remote/api_lottery.dart';
import '../dtos/add_complaint_dto.dart';


class ComplaintRemoteRepository implements IComplaintRepository{
  ComplaintRemoteRepository({required this.apiComplaint});

  final ApiComplaint apiComplaint;


  /*@override
  Future<Either<Failure, LotteryParticipationResponse>> listLotteryParticipation(String phone, int page, int size) async {
    // TODO: implement listLotteryParticipation

    final Map<String, dynamic> params = {"phone": phone, "page": page, "size": size};
    try {
      final HttpResponse<LotteryParticipationResponse> httpResponse =
      await apiComplaint.getListLotteryParticipation(params);

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
*/

  @override
  Future<Either<Failure, ComplaintDataResponse>> saveComplaint(AddComplaintDto params) async {
    // TODO: implement saveComplaint
    try {
      final HttpResponse<ComplaintDataResponse> httpResponse =
      await apiComplaint.createComplaint(params.toJson());
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
