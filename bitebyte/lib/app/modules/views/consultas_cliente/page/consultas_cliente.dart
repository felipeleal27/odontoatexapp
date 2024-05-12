import 'package:bitebyte/app/modules/views/consultas_cliente/controller/consultas_cliente_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

class ConsultasClientePage extends StatefulWidget {
  const ConsultasClientePage({super.key});

  @override
  State<ConsultasClientePage> createState() => _ConsultasClientePageState();
}

class _ConsultasClientePageState extends State<ConsultasClientePage> {
  final controller = Modular.get<ConsultasController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas do Cliente'),
        centerTitle: true,
        actions: [
          // Container(
          //   width: 50,
          //   height: 50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(100),
          //     color: Colors.white,
          //     image: const DecorationImage(
          //       image: AssetImage('assets/imagens/logoapp.png'),
          //     ),
          //   ),
          //   margin: const EdgeInsets.only(right: 10),
          // ),
          IconButton(
              onPressed: () {
                controller.showMenuAction(context, onViewPress: () {});
              },
              icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                Expanded(
                  child: Text(
                    DateFormat("dd/MM/yyyy").format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Centraliza o texto
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height.h * 0.02,
            ),
            const Text(
              'LIMPEZA',
              style:
                  TextStyle(fontSize: 18, decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.question_mark_sharp,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        spaceBetweenChildren: 20,
        buttonSize: const Size(65, 65),
        children: [
          //Segunda opção
          SpeedDialChild(
            child: const Icon(
              Icons.nat,
            ),
            backgroundColor: Colors.blue[300],
            label: 'Dúvidas no E-mail',
            onTap: () {},
          ),

          //Primeira opção
          SpeedDialChild(
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.blue[300],
            label: 'Duvidas no Whatsapp',
            onTap: () {
              controller.viewPdf(context, '20', '');
            },
          ),
        ],
      ),
    );
  }
}
