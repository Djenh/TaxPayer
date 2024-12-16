import 'package:get/get.dart';
import 'package:invoice_app/core/constants/strings.dart';
import 'package:invoice_app/core/services/app_storage.dart';
import 'package:invoice_app/utils/logger_util.dart';


class AppServices extends GetxService {
  static AppServices get instance => Get.find();

  Rx<String?> currentUser = Rx<String?>(null);
  String? authTokenUser;

  Future<AppServices> init() async {
    await AppStorage.instance.storage;
    await checkUser();
    await checkUserToken();
    return this;
  }


  Future<void> checkUser() async {
    if (AppStorage.instance.exist(dataUser)) {
      currentUser.value = "John Doe";
      AppLogger.info("current user info : $currentUser");
    } else {
      currentUser.value = null;
    }
  }


  Future<void> checkUserToken() async {
    if (AppStorage.instance.exist(usrTokenAuth)) {
      authTokenUser = await AppStorage.instance.getDataStorage(usrTokenAuth);
      AppLogger.info("token auth user : $authTokenUser");
    } else {
      authTokenUser = "";
    }
  }

}
