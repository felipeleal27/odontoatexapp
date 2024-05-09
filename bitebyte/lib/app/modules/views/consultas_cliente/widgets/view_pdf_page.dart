// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ViewPdfPage extends StatefulWidget {
  final String path;

  const ViewPdfPage({Key? key, required this.path}) : super(key: key);

  @override
  State<ViewPdfPage> createState() => _ViewPdfPageState();
}

class _ViewPdfPageState extends State<ViewPdfPage> {
  int _totalPages = 0;
  final int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController? _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              _pdfViewController!.setPage(_currentPage - 1);
            },
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              _pdfViewController!.setPage(_currentPage + 1);
            },
          ),
        ],
      ),
      body: Stack(
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
              setState(() {});
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

// ...

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await Permission.storage.request().isGranted) {
            final Directory dir = await getApplicationDocumentsDirectory();
            final String newPath = '${dir.path}/example.pdf';

            final File originalFile = File(widget.path);
            final File newFile = File(newPath);

            await newFile.writeAsBytes(await originalFile.readAsBytes());

            // Abre o arquivo com um aplicativo externo
            OpenFile.open(newPath);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('PDF salvo em: $newPath')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Permissão de armazenamento negada')),
            );
          }
        },
      ),
    );
  }
}
