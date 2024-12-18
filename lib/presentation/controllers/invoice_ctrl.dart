import 'package:get/get.dart';
import 'package:invoice_app/domain/usecases/invoice_uc.dart';


class InvoiceCtrl extends GetxController {
  InvoiceCtrl({required this.invoiceUc});

  final InvoiceUc invoiceUc;


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