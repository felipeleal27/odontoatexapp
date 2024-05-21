// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class ViewPdfPage extends StatefulWidget {
  final String path;
  final String date;

  const ViewPdfPage({super.key, required this.path, required this.date});

  @override
  State<ViewPdfPage> createState() => _ViewPdfPageState();
}

class _ViewPdfPageState extends State<ViewPdfPage> {
  int _totalPages = 0;
  int _currentPage = 0;
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
                  '${_currentPage + 1} / $_totalPages'), // Adicione 1 ao exibir o número da página
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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        spaceBetweenChildren: 20,
        buttonSize: const Size(65, 65),
        children: [
          //Segunda opção
          SpeedDialChild(
            child: const Icon(
              Icons.save,
            ),
            backgroundColor: Colors.blue[300],
            label: 'Baixar PDF',
            onTap: () async {
              if (await Permission.storage.request().isGranted) {
                final String dir =
                    await ExternalPath.getExternalStoragePublicDirectory(
                        ExternalPath.DIRECTORY_DOWNLOADS);
                final String newPath = '$dir/consulta_${widget.date}.pdf';

                File file = File(widget.path);
                file.copy(newPath);

                OpenFile.open(newPath);
              }
            },
          ),

          //Primeira opção
          SpeedDialChild(
            child: const Icon(Icons.question_mark_sharp),
            backgroundColor: Colors.blue[300],
            label: 'Dúvidas no E-mail',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
