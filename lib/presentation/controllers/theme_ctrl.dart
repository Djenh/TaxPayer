import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../res/themes/overlay/app_overlay.dart';


class ThemeCtrl extends GetxController {
  static ThemeCtrl get instance => Get.find();
  Rx<SystemUiOverlayStyle> overStyle = AppUiOverlay.started.obs;


  /// updates the overlay style
  void updateOverStyle(SystemUiOverlayStyle value) {
    overStyle.value = value;
    update();
  }
}
