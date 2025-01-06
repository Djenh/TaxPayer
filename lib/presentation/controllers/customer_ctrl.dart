import 'package:get/get.dart';
import 'package:invoice_app/domain/usecases/customer_uc.dart';

class CustomerCtrl extends GetxController {
  CustomerCtrl({required this.customerUc});

  final CustomerUc customerUc;


  RxBool isLoading = false.obs;

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
}