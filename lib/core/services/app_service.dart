import 'dart:convert';

import 'package:get/get.dart';
import 'package:invoice_app/core/constants/strings.dart';
import 'package:invoice_app/core/services/app_storage.dart';
import 'package:invoice_app/domain/entities/company/company_tin_response.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/utils/logger_util.dart';


class AppServices extends GetxService {
  static AppServices get instance => Get.find();

  Rx<String?> currentUser = Rx<String?>(null);
  Rx<CompanyTinResponse?> currentCompany = Rx<CompanyTinResponse?>(null);
  Rx<PosDataResponse?> currentPos = Rx<PosDataResponse?>(null);
  String? authTokenUser;
  String? refreshAuthTokenUser;

  Future<AppServices> init() async {
    await AppStorage.instance.storage;
    await checkUserToken();
    await checkCompanyData();
    await checkCurrentPosData();
    return this;
  }


  Future<void> checkCompanyData() async {
    if (AppStorage.instance.exist(dataCompany)) {
      currentCompany.value = CompanyTinResponse.fromJson(
          json.decode(await AppStorage.instance.getDataStorage(dataCompany)));
      AppLogger.info("current company info : ${currentCompany.toJson()}");
    } else {
      currentCompany.value = null;
    }
  }

  Future<void> checkCurrentPosData() async {
    if (AppStorage.instance.exist(dataPos)) {
      currentPos.value = PosDataResponse.fromJson(
          json.decode(await AppStorage.instance.getDataStorage(dataPos)));
      AppLogger.info("current pos info : ${currentPos.toJson()}");
    } else {
      currentPos.value = null;
    }
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
      refreshAuthTokenUser = await AppStorage.instance.getDataStorage(usrRefreshTokenAuth);
      AppLogger.info("token auth user : $authTokenUser");
    } else {
      authTokenUser = "";
      refreshAuthTokenUser = "";
    }
  }

}
