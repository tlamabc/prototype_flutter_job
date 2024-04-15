import 'dart:io';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanDocument extends StatefulWidget {
  @override
  _ScanDocumentState createState() => _ScanDocumentState();
}

class _ScanDocumentState extends State<ScanDocument> {
  Future<void> _scanDoc() async {
    try {
      // Launch the scanner specifying source as CAMERA (or modify for gallery)
      final scannedDoc = await DocumentScannerFlutter.launch(source: ScannerFileSource.CAMERA);

      if (scannedDoc != null) {
        // Document scanned successfully!
        // Handle the scanned document file (e.g., display, save, process further)
        print('Scanned document saved at: ${scannedDoc.path}');

        // Example: Save the scanned document to a specific location
        final directory = await Directory('your/desired/directory');
        if (!directory.existsSync()) {
          await directory.create(recursive: true);
        }
        final newFile = await scannedDoc.copy('${directory.path}/scanned_document.jpg');
        print('Document saved to: ${newFile.path}');
      }
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      print('Platform error: ${e.message}');
    } catch (e) {
      // Handle other unexpected errors
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Scanner'),
      ),
      body: Center(
        child: Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: _scanDoc, // Call the _scanDoc function on tap
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/img/icons8_plus_50.png',
                width: 30,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
