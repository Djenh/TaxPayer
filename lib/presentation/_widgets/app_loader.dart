import 'package:flutter/material.dart';

class AppLoaderDialog {

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //SpinKitCircle(color: KStyles.primaryColor, size: 50.0),
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  "Veuillez patienter...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void dismiss(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

}
