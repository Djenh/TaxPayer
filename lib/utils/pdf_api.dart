import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File?>? generate() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final file = File('example.pdf');
    return file.writeAsBytes(await pdf.save());
  }
}
