import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'app_service.dart';


Future<void> initAppServices() async {
  Get.engine;
/*  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);*/
  await dotenv.load(fileName: ".env");
  await Get.putAsync(() => AppServices().init(), permanent: true);
  setupLocator();
}
