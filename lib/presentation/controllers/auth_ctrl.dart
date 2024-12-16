import 'dart:async';

import 'package:get/get.dart';
import 'package:invoice_app/domain/usecases/auth_uc.dart';



class AuthCtrl extends GetxController {
  AuthCtrl({required this.authUc});

  final AuthUc authUc;

  RxBool isLoading = false.obs;
  var timing = 120.obs;

  RxBool get ignorePointer => RxBool(isLoading.isTrue);

  //void _setLoading(bool value) => isLoading.value = value;

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







}