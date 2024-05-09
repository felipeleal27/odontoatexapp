// ignore_for_file: library_prefixes, use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:permission_handler/permission_handler.dart';

part 'consultas_cliente_controller.g.dart';

class ConsultasController = ConsultasControllerBase with _$ConsultasController;

abstract class ConsultasControllerBase with Store {
  @action
  createPdf(BuildContext context, String date, String professor) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    pdf.addPage(
      pdfLib.Page(
        build: (context) {
          return pdfLib.Center(
            child: pdfLib.Text('HACKATON 2024 - PDF'),
          );
        },
      ),
    );
    final String dir = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final String path =
        '$dir/CONSULTA_$date.pdf'; // Adicione o nome do arquivo ao caminho

    File file = File(path);
    final Uint8List pdfBytes = await pdf.save();
    file.writeAsBytesSync(pdfBytes);

    // Abre o arquivo com um aplicativo externo
    OpenFile.open(file.path);
  }

  Future<void> saveFile() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      String path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
      final directory = Directory(path);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      final file = File('$path/my_file.txt');
      await file.writeAsString('Hello World');
    } else {
      if (kDebugMode) {
        print("Permissão de armazenamento negada");
      }
    }
  }
}
