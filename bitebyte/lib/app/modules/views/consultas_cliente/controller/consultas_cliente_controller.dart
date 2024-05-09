// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'package:bitebyte/app/modules/views/consultas_cliente/widgets/view_pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;

part 'consultas_cliente_controller.g.dart';

class ConsultasController = ConsultasControllerBase with _$ConsultasController;

abstract class ConsultasControllerBase with Store {
  @action
  createPdf(BuildContext context, String date, bool viewPdf) async {
    final size = MediaQuery.of(context).size;
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);

    ByteData bytes = await rootBundle.load('assets/imagens/unifenaslogo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    ByteData bytes2 = await rootBundle.load('assets/imagens/logobite.png');
    final Uint8List byteList2 = bytes2.buffer.asUint8List();

    pdf.addPage(
      pdfLib.Page(
        build: (context) {
          return pdfLib.Container(
            decoration: pdfLib.BoxDecoration(
              border: pdfLib.Border.all(width: 1),
            ),
            child: pdfLib.Stack(
              children: [
                pdfLib.Column(
                  children: [
                    pdfLib.Expanded(
                      child: pdfLib.Container(),
                    ),
                    pdfLib.Padding(
                      padding: const pdfLib.EdgeInsets.all(10),
                      child: pdfLib.SizedBox(
                        width: size.width.w / 1.5,
                        height: size.height.h / 20,
                        child: pdfLib.Image(
                          pdfLib.MemoryImage(
                            byteList,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                pdfLib.Positioned(
                  top: 10,
                  right: 10,
                  child: pdfLib.SizedBox(
                    width: 50,
                    height: 50,
                    child: pdfLib.Image(
                      pdfLib.MemoryImage(
                        byteList2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/consulta_novo.pdf';

    final File file = File(path);
    final Uint8List pdfBytes = await pdf.save();
    file.writeAsBytesSync(pdfBytes);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewPdfPage(path: path)));
    file.writeAsBytesSync(pdfBytes);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewPdfPage(path: path)));
  }
}
