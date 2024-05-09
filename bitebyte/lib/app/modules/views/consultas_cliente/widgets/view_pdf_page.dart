// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class ViewPdfPage extends StatefulWidget {
  final String path;

  const ViewPdfPage({Key? key, required this.path}) : super(key: key);

  @override
  State<ViewPdfPage> createState() => _ViewPdfPageState();
}

class _ViewPdfPageState extends State<ViewPdfPage> {
  int _totalPages = 0;
  int _currentPage = 0; // Comece de 0 novamente
  bool pdfReady = false;
  PDFViewController? _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documento"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                PDFView(
                  filePath: widget.path,
                  autoSpacing: true,
                  enableSwipe: true,
                  pageSnap: true,
                  swipeHorizontal: true,
                  nightMode: false,
                  onError: (err) {
                    if (kDebugMode) {
                      print(err);
                    }
                  },
                  onRender: (pages) {
                    setState(() {
                      _totalPages = pages!;
                      pdfReady = true;
                    });
                  },
                  onViewCreated: (PDFViewController vc) {
                    _pdfViewController = vc;
                  },
                  onPageChanged: (int? page, int? total) {
                    setState(() {
                      _currentPage = page!; // Atualize o valor de _currentPage
                    });
                  },
                  onPageError: (page, err) {},
                ),
                !pdfReady
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Offstage()
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  _pdfViewController!.setPage(_currentPage - 1);
                },
              ),
              Text(
                  '${_currentPage + 1}'), // Adicione 1 ao exibir o número da página
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  _pdfViewController!.setPage(_currentPage + 1);
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await Permission.storage.request().isGranted) {
            final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
            final String dir =
                await ExternalPath.getExternalStoragePublicDirectory(
                    ExternalPath.DIRECTORY_DOWNLOADS);
            final String path = '$dir/consulta.pdf';

            File file = File(path);
            final Uint8List pdfBytes = await pdf.save();
            file.writeAsBytesSync(pdfBytes);

            OpenFile.open(file.path);
          }
        },
        child: const Icon(Icons.download, color: Colors.white),
      ),
    );
  }
}
