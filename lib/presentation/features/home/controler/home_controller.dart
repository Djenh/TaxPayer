import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var  selectedIndex = 0.obs;
  updateSelectedIndex (value){
    selectedIndex.value= value;
    debugPrint(value);
    debugPrint("object ${selectedIndex.value}");
  }

}
