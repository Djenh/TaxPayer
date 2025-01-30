import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '_widgets/error_scan_dialog.dart';

class ScanVerifyPage extends StatefulWidget {
  const ScanVerifyPage({super.key});

  @override
  State<ScanVerifyPage> createState() => _ScanVerifyPageState();
}

class _ScanVerifyPageState extends State<ScanVerifyPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Center(child: buildText(context, "Scannez le code QR", 18,
              Colors.white, fontWeight: FontWeight.w600, textAlign: TextAlign.center)),
          const SizedBox(height: 8),
          Center(child: buildText(context, "Le scannage démarre automatiquement",
              14, Colors.white, fontWeight: FontWeight.w400, textAlign: TextAlign.center)),
          const SizedBox(height: 20),
          Expanded(
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates
              ),
              onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;

                for (final barcode in barcodes){
                  debugPrint('Barcode détecté : ${barcode.rawValue}');
                  final String? code = barcode.rawValue;

                  if(code != null || code!.trim().isNotEmpty){
                    debugPrint('Code scanné : $code');
                    if(code == "https://flutter.dev/"){
                      //Get.to(() => const ResultVerifyInvoicePage());
                      _showErrorDialog(context);
                    }
                    break;
                  } else{
                    debugPrint("Erreur : code QR vide ou invalide détecté.");
                    _showErrorDialog(context);
                    break;
                  }
                }
              },
              /*onScannerStarted: (MobileScannerArguments? args) {
                debugPrint('Scanner démarré : ${args?.hasTorch}');
              },*/
              errorBuilder: (context, exception, child) {
                return Center(
                  child: Text(
                    'Erreur de caméra : ${exception.errorCode}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const ErrorScanDialog();
      },
    );
  }
}
