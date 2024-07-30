import 'package:get/get.dart';

class HomeController extends GetxController {
  var  selectedIndex = 0.obs;
  updateSelectedIndex (value){
    selectedIndex.value= value;
    print(value);
    print("object ${selectedIndex.value}");
  }

}
