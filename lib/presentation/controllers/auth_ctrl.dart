import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/constants/strings.dart';
import 'package:invoice_app/core/errors/request_failures.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/core/services/app_storage.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/data/dtos/login_dto.dart';
import 'package:invoice_app/domain/entities/auth/login_response.dart';
import 'package:invoice_app/domain/usecases/auth_uc.dart';
import 'package:invoice_app/presentation/features/home/screens/home_page.dart';
import 'package:invoice_app/utils/logger_util.dart';



class AuthCtrl extends GetxController {
  AuthCtrl({required this.authUc});

  final AuthUc authUc;

  RxBool isLoading = false.obs;
  var timing = 120.obs;

  RxBool get ignorePointer => RxBool(isLoading.isTrue);

  void _setLoading(bool value) => isLoading.value = value;

  void onPopInvoked(bool didPop) {
    if (didPop) {
      return;
    }
    if (isLoading.isFalse) {
      Get.back();
    }
  }


  /// Fonction pour hacher un email
  String hashEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final username = parts[0];
    final domain = parts[1];
    final hiddenUsername = username.length > 2
        ? "${username.substring(0, 2)}***"
        : "${username.substring(0, 1)}***";
    return "$hiddenUsername@$domain";
  }


  /// Fonction pour hacher un numéro de téléphone
  String hashPhone(String phone) {
    if (phone.length < 4) return phone;

    final visibleStart = phone.substring(0, 2);
    final visibleEnd = phone.substring(phone.length - 2);
    return "$visibleStart *** $visibleEnd";
  }


  /// Timer pour permettre l'option "Renvoyer le code"
  String formatMinuteSecond(Duration d) => d.toString().substring(2, 7);

  Future<void> makeTimer() async {
    timing(120);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timing.value == 0) {
        timer.cancel();
      } else {
        timing.value--;
      }
    });
  }


  ///func to login user
  Future<void> loginUser(BuildContext context, LoginDto params) async {
    LoginResponse? response;

    String formDataLogin = await params.toUrlEncoded();

    try {
      _setLoading(true);

      final Either<Failure, LoginResponse> result =
          await authUc.executeAuthUser(params.clientId, params.username,
              params.password, params.grantType);

      result.fold((Failure failure) {
        AppLogger.error("fetch data failed: ${failure.message}");
        ToastService.showError(context, 'Connexion', description: failure.message);
      }, (LoginResponse authData) async {
        AppLogger.info("authData successful: ${authData.toJson()}");
        await _handleLoginSuccess(authData);
      });
    } catch (e) {
      AppLogger.error('An error occurred during loginUser : $e');
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _handleLoginSuccess(LoginResponse response) async {

    AppStorage.instance
      ..setString(key: usrTokenAuth, value: response.accessToken!)
      ..setString(key: usrRefreshTokenAuth, value: response.refreshToken!);

    AppServices.instance
      ..checkUser()
      ..checkUserToken();

    Get.offAll(() => HomePage());
  }



}