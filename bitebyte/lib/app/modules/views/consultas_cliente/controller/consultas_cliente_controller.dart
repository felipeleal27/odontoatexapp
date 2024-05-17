// ignore_for_file: use_build_context_synchronously, library_prefixes

import 'dart:io';
import 'package:bitebyte/app/modules/views/consultas_cliente/widgets/view_pdf_page.dart';
import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;

part 'consultas_cliente_controller.g.dart';

class ConsultasController = ConsultasControllerBase with _$ConsultasController;

abstract class ConsultasControllerBase with Store {
  final homeController = Modular.get<HomeController>();

  @observable
  bool viewPDFLoadign = false;

  @action
  void setLoadingViewPDF() => viewPDFLoadign = !viewPDFLoadign;

  Future<void> showMenuAction(BuildContext context,
      {required Null Function() onViewPress,
      Null Function()? onDownloadPress}) async {
    return showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 80, 0, 0), // posição do menu
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text("Visualizar PDF"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("Download PDF"),
        ),
        // Adicione mais itens aqui
      ],
    ).then((value) {
      if (value != null) {
        value == 1 ? viewPdf(context, '2020', '') : onDownloadPress;
      }
    });
  }

  @action
  viewPdf(BuildContext context, String date, String prof) async {
    final size = MediaQuery.of(context).size;
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);

    ByteData bytes = await rootBundle.load('assets/imagens/unifenaslogo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    ByteData bytes2 = await rootBundle.load('assets/imagens/logobite.png');
    final Uint8List byteList2 = bytes2.buffer.asUint8List();

    for (var index = 0; index < homeController.selecteds.length; index++) {
      if (homeController.selecteds[index]) {
        pdf.addPage(
          pdfLib.Page(
            margin: const pdfLib.EdgeInsets.all(30),
            build: (context) {
              return pdfLib.Container(
                padding: const pdfLib.EdgeInsets.all(0),
                decoration: pdfLib.BoxDecoration(
                  border: pdfLib.Border.all(width: 1),
                ),
                child: pdfLib.Stack(
                  children: [
                    pdfLib.Center(
                      child: pdfLib.Opacity(
                        opacity: 0.28,
                        child: pdfLib.SizedBox(
                          width: size.width.w * 0.85,
                          height: size.height.h * 0.85,
                          child: pdfLib.Image(
                            pdfLib.MemoryImage(
                              byteList2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    pdfLib.Column(
                      children: [
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
                        pdfLib.Padding(
                          padding: const pdfLib.EdgeInsets.all(20),
                          child: pdfLib.Column(
                            children: [
                              // pdfLib.Text(
                              //   'FELIPE DA SILVA LEAL',
                              //   style: pdfLib.TextStyle(
                              //     fontSize: 22,
                              //     fontWeight: pdfLib.FontWeight.bold,
                              //     decoration: pdfLib.TextDecoration.underline,
                              //   ),
                              // ),
                              pdfLib.SizedBox(height: size.height.h / 80),
                              pdfLib.Text(
                                'CONSULTA ODONTOLÓGICA',
                                style: pdfLib.TextStyle(
                                  fontSize: 18,
                                  fontWeight: pdfLib.FontWeight.bold,
                                  decoration: pdfLib.TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pdfLib.SizedBox(height: size.height.h * .02),
                        pdfLib.Padding(
                          padding: const pdfLib.EdgeInsets.all(15),
                          child: pdfLib.Row(
                            children: [
                              pdfLib.Center(
                                child: pdfLib.Column(
                                  crossAxisAlignment:
                                      pdfLib.CrossAxisAlignment.start,
                                  children: [
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 40),
                                      child: pdfLib.Text(
                                        'PACIENTE:',
                                        style: pdfLib.TextStyle(
                                          fontSize: 20,
                                          fontWeight: pdfLib.FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'Nome: Felipe da Silva Leal, 20 anos',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'E-mail: felipe.leal@aluno.unifenas.br',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'Telefone: (35) 9 9999-9999',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'CPF: 123.456.789-00',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    // pdfLib.Padding(
                                    //   padding: const pdfLib.EdgeInsets.only(left: 20),
                                    //   child: pdfLib.Text(
                                    //     'Idade: 20',
                                    //     style: const pdfLib.TextStyle(
                                    //       fontSize: 20,
                                    //     ),
                                    //   ),
                                    // ),
                                    pdfLib.SizedBox(
                                        height: size.height.h * .02),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 40),
                                      child: pdfLib.Text(
                                        'RESPONSÁVEIS:',
                                        style: pdfLib.TextStyle(
                                          fontSize: 20,
                                          fontWeight: pdfLib.FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'Professor:',
                                        style: pdfLib.TextStyle(
                                          fontSize: 18,
                                          fontWeight: pdfLib.FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 60),
                                      child: pdfLib.Text(
                                        'Nome: Carlos Antônio de Souza',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 60),
                                      child: pdfLib.Text(
                                        'E-mail: carlos.souz.@unifenas.br',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'Aluno:',
                                        style: pdfLib.TextStyle(
                                          fontSize: 18,
                                          fontWeight: pdfLib.FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 60),
                                      child: pdfLib.Text(
                                        'Nome: Carlos Antônio de Souza',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 60),
                                      child: pdfLib.Text(
                                        'E-mail: daniel.franca@aluno.unifenas.br',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.SizedBox(
                                        height: size.height.h * .02),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 40),
                                      child: pdfLib.Text(
                                        'PROCEDIMENTO:',
                                        style: pdfLib.TextStyle(
                                          fontSize: 20,
                                          fontWeight: pdfLib.FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'LIMPEZA DENTAL',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                          decoration:
                                              pdfLib.TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'Data: 11/05/20424',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    pdfLib.Padding(
                                      padding: const pdfLib.EdgeInsets.only(
                                          left: 50),
                                      child: pdfLib.Text(
                                        'Hora: 20:30',
                                        style: const pdfLib.TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        pdfLib.Expanded(
                          child: pdfLib.Align(
                            alignment: pdfLib.Alignment.bottomCenter,
                            child: pdfLib.Text(
                              'Alfenas, MG - ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                            ),
                          ),
                        ),
                        pdfLib.SizedBox(height: size.height.h * .02),
                      ],
                    ),
                    pdfLib.Positioned(
                        bottom: 5,
                        right: 5,
                        child: pdfLib.Text(
                            'Página ${index + 1} de ${homeController.selecteds.where((element) => element == true).length}')),
                  ],
                ),
              );
            },
          ),
        );
      }
    }

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/consulta_$date.pdf';

    final File file = File(path);
    final Uint8List pdfBytes = await pdf.save();
    file.writeAsBytesSync(pdfBytes);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewPdfPage(path: path, date: date),
      ),
    );
  }
}
