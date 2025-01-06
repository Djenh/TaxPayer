import 'package:get/get.dart';
import 'package:invoice_app/domain/usecases/product_uc.dart';

class ProductCtrl extends GetxController {
  ProductCtrl({required this.productUc});

  final ProductUc productUc;


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