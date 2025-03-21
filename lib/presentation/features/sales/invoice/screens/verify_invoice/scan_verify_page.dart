import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/controllers/invoice_sifec_ctrl.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/result_verify_invoice_page.dart';
import 'package:invoice_app/utils/utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '_widgets/error_scan_dialog.dart';

class ScanVerifyPage extends StatefulWidget {
  const ScanVerifyPage({super.key});

  @override
  State<ScanVerifyPage> createState() => _ScanVerifyPageState();
}

class _ScanVerifyPageState extends State<ScanVerifyPage> {

  final invSifecCtr = locator<InvoiceSifecCtrl>();
  late MobileScannerController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }


  Future<void> _verifyInvoice(String sig) async {
    await invSifecCtr.invoiceVerify(context, sig, false).then((val){
      if(val != null){
        Get.to(() => ResultVerifyInvoicePage(dataInvoice: val))!.then((val){
          controller.start();
        });
      }else{
        _showErrorDialog(context);
      }
    });
  }


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
              controller: controller,
              onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;

                for (final barcode in barcodes) {
                  debugPrint('Barcode détecté : ${barcode.rawValue}');
                  final String? code = barcode.rawValue;

                  if(code != null && code.trim().isNotEmpty) {
                    debugPrint('Code scanné : $code');
                    debugPrint('Longueur du code : ${code.length}');

                    controller.stop();
                    //final RegExp formatRegex = RegExp(r'^[A-Z0-9]{52}$');
                    String codeExtracted = Utils.extract52CharsBeforeLastSemicolon(code);
                    debugPrint('Longueur du code codeExtracted : $codeExtracted');
                    if(codeExtracted.length == 52) {
                      _verifyInvoice(codeExtracted);
                    } else {
                      debugPrint("Format de QR code invalide");
                      _showErrorDialog(context);
                    }
                    break;
                  } else {
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
                    textAlign: TextAlign.center,
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
      barrierDismissible: false,
      builder: (context) {
        return const ErrorScanDialog();
      },
    );
  }
}
