import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;

part 'consultas_cliente_controller.g.dart';

class ConsultasController = ConsultasControllerBase with _$ConsultasController;

abstract class ConsultasControllerBase with Store {
  @action
  _createPdf() async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    pdf.addPage(
      pdfLib.Page(
        build: (context) {
          return pdfLib.Center(
            child: pdfLib.Text('Hello World'),
          );
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/example.pdf';

    final File file = File(path);
    final Uint8List pdfBytes = await pdf.save();
    file.writeAsBytesSync(pdfBytes);
  }

  void viewPdf() {}
}
