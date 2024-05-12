import 'package:bitebyte/app/modules/views/consultas_cliente/controller/consultas_cliente_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ExpandedItems extends StatefulWidget {
  const ExpandedItems({super.key});

  @override
  State<ExpandedItems> createState() => _ExpandedItemsState();
}

class _ExpandedItemsState extends State<ExpandedItems> {
  final controller = Modular.get<ConsultasController>();
  var date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  var hour = DateFormat("HH:mm").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LIMPEZA',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    const ListTile(
                      leading: Icon(
                        Icons.person_pin,
                      ),
                      title: Text(
                        'Professor:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('CARLOS ALMEIDA', style: TextStyle()),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.person,
                      ),
                      title: Text(
                        'Aluno:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('DANIEL FRANÇA', style: TextStyle()),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.calendar_today,
                      ),
                      title: const Text(
                        'Data:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(date),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.timer_outlined,
                      ),
                      title: const Text(
                        'Horário:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(hour),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ElevatedButton(
              onPressed: () {
                controller.viewPdf(
                    context,
                    DateFormat('yyyyMMddHHmm').format(DateTime.now()),
                    'CARLOS ALMEIDA');
              },
              child: const Text('GERAR PDF'),
            ),
          ),
        ],
      ),
    );
  }
}
