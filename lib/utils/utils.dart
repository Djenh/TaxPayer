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
    if (await canLaunchUrl(Uri.parse(finalURL))) {
      await launchUrl(Uri.parse(finalURL));
    } else {
      throw 'Could not launch $finalURL';
    }
  }

  static Future<void> makeMail(String mail) async {
    final url = 'mailto:$mail';
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url));
    }
  }

  static openWhatsapp(String phoneNumber) async {
    var whatsapp = phoneNumber;
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatAppURLIos = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatAppURLIos))) {
        await launchUrl(Uri.parse(whatAppURLIos));
      } else {
        throw 'Could not launch $whatAppURLIos';
      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        throw 'Could not launch $whatsappURlAndroid';
      }
    }
  }
}
