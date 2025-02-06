import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePagePdf extends StatefulWidget {
  @override
  _MyHomePagePdfState createState() => _MyHomePagePdfState();
}

class _MyHomePagePdfState extends State<MyHomePagePdf> {
  // Sample Data (Replace with your actual data)
  final companyName = "Example Company";
  final companyAddress = "123 Main Street, Anytown";
  final companyPhone = "555-123-4567";
  final companyEmail = "info@example.com";

  final clientName = "John Doe";
  final clientAddress = "456 Oak Avenue, Anytown";
  final clientEmail = "john.doe@example.com";

  final products = [
    {"name": "Product A", "price": 10.0, "quantity": 2},
    {"name": "Product B", "price": 20.0, "quantity": 1},
    {"name": "Product C", "price": 5.0, "quantity": 5},
    {"name": "Product A", "price": 10.0, "quantity": 2},
    {"name": "Product B", "price": 20.0, "quantity": 1},
    {"name": "Product C", "price": 5.0, "quantity": 5},
    {"name": "Product A", "price": 10.0, "quantity": 2},
    {"name": "Product B", "price": 20.0, "quantity": 1},
    {"name": "Product C", "price": 5.0, "quantity": 5},
    {"name": "Product A", "price": 10.0, "quantity": 2},
    {"name": "Product B", "price": 20.0, "quantity": 1},
    {"name": "Product C", "price": 5.0, "quantity": 5},
    {"name": "Product A", "price": 10.0, "quantity": 2},
    {"name": "Product B", "price": 20.0, "quantity": 1},
    {"name": "Product C", "price": 5.0, "quantity": 5},
  ];

  final taxes = [
    {"name": "VAT", "rate": 0.20}, // 20% VAT
  ];

  Future<void> _generateAndPrintPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) => [
          // Header
          pw.Header(
            level: 0,
            child: pw.Text('Invoice', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Divider(),

          // Company Information
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(companyName, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(companyAddress),
                  pw.Text('Phone: $companyPhone'),
                  pw.Text('Email: $companyEmail'),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Date: ${DateTime.now().toString().substring(0, 10)}'),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),

          // Client Information
          pw.Text('Bill to:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(clientName),
              pw.Text(clientAddress),
              pw.Text('Email: $clientEmail'),
            ],
          ),
          pw.SizedBox(height: 20),

          // Product Table
          pw.Table.fromTextArray(
            context: context,
            data: <List<String>>[
              <String>['Product', 'Quantity', 'Price', 'Total'],
              ...products.map((product) => [
                product['name'] as String,
                product['quantity'].toString(),
                product['price'].toString(),
                ((product['price'] as double) * (product['quantity'] as int)).toStringAsFixed(2),
              ]).toList(),
            ],
            border: pw.TableBorder.all(),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            cellAlignment: pw.Alignment.centerLeft,
          ),
          pw.SizedBox(height: 20),
          pw.Table.fromTextArray(
            context: context,
            data: <List<String>>[
              <String>['Product', 'Quantity', 'Price', 'Total'],
              ...products.map((product) => [
                product['name'] as String,
                product['quantity'].toString(),
                product['price'].toString(),
                ((product['price'] as double) * (product['quantity'] as int)).toStringAsFixed(2),
              ]).toList(),
            ],
            border: pw.TableBorder.all(),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            cellAlignment: pw.Alignment.centerLeft,
          ),
          pw.SizedBox(height: 20),

          // Calculate Totals
          pw.Container(
            alignment: pw.Alignment.centerRight,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text('Subtotal: \$${calculateSubtotal().toStringAsFixed(2)}'),
                ...taxes.map((tax) {
                  final taxAmount = calculateSubtotal() * (tax['rate'] as double);
                  return pw.Text('${tax['name']} (${((tax['rate'] as double) * 100).toStringAsFixed(0)}%): \$${taxAmount.toStringAsFixed(2)}');
                }).toList(),
                pw.Divider(),
                pw.Text('Total: \$${calculateTotal().toStringAsFixed(2)}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ),
          pw.SizedBox(height: 20),

          // Signature and QR Code
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Signature:'),
                  pw.SizedBox(height: 20),
                  pw.Text('_________________________'), // Placeholder for signature
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Scan to Pay:'),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    width: 80,
                    height: 80,
                    child: pw.BarcodeWidget(
                      barcode: pw.Barcode.qrCode(),
                      data: 'payment_link_or_data', // Replace with actual payment data
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),

          // Footer
          pw.Footer(
            title:  pw.Text('Thank you for your business!'),
            padding: const pw.EdgeInsets.all(8.0),
            decoration: const pw.BoxDecoration(
              border: pw.Border(top: pw.BorderSide(color: PdfColors.grey300)),
            ),
          ),
        ],
      ),
    );

    // Save the PDF
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example23.pdf");
    await file.writeAsBytes(await pdf.save());

    // Print or View the PDF
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'invoicew3w.pdf');

    // Option 1: Print Directly (Requires printer setup on the device)
    // await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());

    // Option 2: Open in PDF Viewer (Using printing package)
    // await Printing.sharePdf(bytes: await pdf.save(), filename: 'invoice.pdf');

    // Option 3: Save to Device Storage (Requires permissions)
    // final output = await getExternalStorageDirectory(); // Use getApplicationDocumentsDirectory() for app-specific storage
    // final file = File("${output!.path}/invoice.pdf");
    // await file.writeAsBytes(await pdf.save());
    // print("PDF saved to: ${file.path}");
  }

  double calculateSubtotal() {
    return products.fold(0.0, (sum, product) => sum + ((product['price'] as double) * (product['quantity'] as int)));
  }

  double calculateTotal() {
    double subtotal = calculateSubtotal();
    double taxAmount = taxes.fold(0.0, (sum, tax) => sum + subtotal * (tax['rate'] as double));
    return subtotal + taxAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Generator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _generateAndPrintPdf,
          child: Text('Generate and Print PDF'),
        ),
      ),
    );
  }
}
