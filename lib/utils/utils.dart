import 'dart:io';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils{

  static String typeProduct(String type){
    return (type == "goods") ? "Biens" : "Services";
  }


  static String getFormattedAmount(num solde) {
    return NumberFormat.currency(
      locale: ui.window.locale.languageCode,
      decimalDigits: 2,
      symbol: '',
    ).format(solde);
  }

  static Future<void> makePhoneCall(String phoneNumebr) async {
    String finalURL = 'tel://$phoneNumebr';
    if (await canLaunch(finalURL)) {
      await launch(finalURL);
    } else {
      throw 'Could not launch $finalURL';
    }
  }

  static Future<void> makeMail(String mail) async {
    final url = 'mailto:$mail';
    if(await canLaunch(url)){
      await launch(url);
    }
  }

  static openWhatsapp(String phoneNumber) async {
    var whatsapp = phoneNumber;
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatAppURLIos = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      if (await canLaunch(whatAppURLIos)) {
        await launch(whatAppURLIos, forceSafariVC: false);
      } else {
        throw 'Could not launch $whatAppURLIos';
      }
    } else {
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        throw 'Could not launch $whatsappURlAndroid';
      }
    }
  }
}
