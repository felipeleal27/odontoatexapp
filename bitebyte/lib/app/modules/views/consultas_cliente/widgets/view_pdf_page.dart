import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewPdfPage extends StatelessWidget {
  const ViewPdfPage(this.pathPDF, {super.key});

  final String pathPDF;

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: pathPDF,
    );
  }
}
