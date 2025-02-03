import 'dart:io';
import 'dart:ui' as ui;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils{
  static String getLocale() => ui.window.locale.languageCode;
  static String extract52CharsBeforeLastSemicolon(String input) {
    int lastSemicolonIndex = input.lastIndexOf(';');
    if (lastSemicolonIndex != -1) {
      String beforeLastSemicolon = input.substring(0, lastSemicolonIndex);
      if (beforeLastSemicolon.length >= 52) {
        return beforeLastSemicolon.substring(beforeLastSemicolon.length - 52);
      } else {
        return beforeLastSemicolon;
      }
    }
    return "";
  }
  static String formatCreatedAt(String createdAt) {
    initializeDateFormatting();//YEAR_ABBR_MONTH_WEEKDAY_DAY
    DateTime dateTime = DateTime.parse(createdAt);
    var format = DateFormat(
        DateFormat.YEAR_MONTH_WEEKDAY_DAY, getLocale());
    var time = DateFormat(DateFormat.HOUR24_MINUTE, getLocale());
    return '${format.format(dateTime)} ${time.format(dateTime)}';
  }
  static String formatAndTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    var format = DateFormat('dd/MM/yyyy HH:mm:ss');

    return format.format(dateTime);
  }
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

  static String getFormattedAmountOne(num solde) {
    return NumberFormat.currency(
      locale: ui.window.locale.languageCode,
      decimalDigits: 1,
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
